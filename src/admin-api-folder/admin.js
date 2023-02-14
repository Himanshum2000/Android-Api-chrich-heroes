const express = require("express");
const app = express.Router();
const con = require("../db/conn");
const multer = require("multer");
var jwt = require("jsonwebtoken");
const cors = require("cors");
const path = require("path");
const fs = require("fs");
require("dotenv").config();
const bcrypt = require("bcrypt");
var bodyParser = require("body-parser");
const { run } = require("forever/lib/forever/cli");
const { match } = require("assert");
app.use(cors());
app.use(bodyParser.json({ limit: "50mb" }));
app.use(
  bodyParser.urlencoded({
    limit: "50mb",
    extended: true,
    parameterLimit: 50000,
  })
);
app.use("/", express.static(__dirname + ""));

const storage_banner = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "image/banners-details");
  },
  filename: function (req, file, cb) {
    const uniqueSuffix = Date.now() + "-" + Math.round(Math.random() * 1e9);
    cb(null, file.fieldname + "-" + uniqueSuffix + ".png");
  },
});
const upload_banner = multer({ storage: storage_banner });

const storage_player = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "image/player");
  },
  filename: function (req, file, cb) {
    const uniqueSuffix = Date.now() + "-" + Math.round(Math.random() * 1e9);
    cb(null, file.fieldname + "-" + uniqueSuffix + ".png");
  },
});
const upload_player = multer({ storage: storage_player });

app.get("/get-all", (req, res) => {
  res.send("Hello, this url for testing Purpose ton create");
});
app.post("/register", (req, res) => {
  const salt = bcrypt.genSaltSync(10);
  const hash = bcrypt.hashSync(req.body.password, salt);
  con.query(
    "select * from login where username = ?",
    [req.body.username],
    (err, result) => {
      if (err) throw err;
      if (result[0] == null) {
        con.query(
          "INSERT INTO `login`(`username`, `password`) VALUES (?,?)",
          [req.body.username, hash],
          (err, result) => {
            if (err) throw err;
            else {
              res.status(200).send(true);
            }
          }
        );
      } else {
        res.send("Username is already exist");
      }
    }
  );
});
app.post("/login", (req, res) => {
  con.query(
    "select * from login where username = ?",
    [req.body.username],
    (err, result) => {
      if (err) throw err;
      if (result[0] != null) {
        const match = bcrypt.compareSync(req.body.password, result[0].password);
        if (match) {
          jwt.sign(
            { username: result[0].username },
            process.env.ACCESS_TOKEN_SECRET,
            (err, token) => {
              if (err) throw err;
              else
                res.status(200).json({
                  status: true,
                  username: result[0].username,
                  token,
                });
            }
          );
        } else {
          res.send("Username And Password is Wrong!");
        }
      } else {
        res.send("Username is not exist");
      }
    }
  );
});
app.post("/get-user", verifytoken, (req, res) => {
  con.query("SELECT * FROM `user`", (err, result) => {
    if (err) throw err;
    else {
      res.status(200).send({ data: result });
    }
  });
});
app.post("/del-user", verifytoken, (req, res) => {
  con.query(
    "DELETE FROM `user` WHERE `id` = ?",
    [req.body.id],
    (err, result) => {
      if (err) throw err;
      if (result) {
        res.status(200).send({
          error: false,
          status: true,
          massage: "Your User has been Deleted SuccessFully",
        });
      }
    }
  );
});
app.post("/status-user", verifytoken, (req, res) => {
  con.query(
    "UPDATE `user` SET `status`=? WHERE `id` = ?",
    [req.body.status, req.body.id],
    (err, result) => {
      if (err) throw err;
      else {
        res.status(200).send(true);
      }
    }
  );
});
app.post("/get-menu", verifytoken, (req, res) => {
  con.query(
    "SELECT id FROM `login` where `username`=?",
    [req.body.username],
    (err, result) => {
      if (err) throw err;
      if (result) {
        con.query(
          "select role_id from role_assign where user_id = ?;",
          [result[0].id],
          (role_err, role_result) => {
            if (role_err) throw role_err;
            if (role_result.length > 0) {
              con.query(
                "SELECT am.id,m.module_name,m.url,am.status,am.date FROM assign_module as am inner Join module as m on am.module = m.id where role = ? ORDER BY am.module ASC;",
                [role_result[0].role_id],
                (ro_err, ro_result) => {
                  if (ro_err) throw ro_err;
                  if (ro_result) {
                    res.status(200).json({
                      error: false,
                      status: true,
                      data: ro_result,
                    });
                  }
                }
              );
            } else {
              res.status(404).json({
                error: true,
                status: false,
                massage: "This user is not assigned role",
              });
            }
          }
        );
      }
    }
  );
});
app.post("/add-role", verifytoken, (req, res) => {
  con.query(
    "select * from role where display_name=?",
    [req.body.display_name],
    (err, result) => {
      if (err) throw err;
      if (result.length > 0) {
        res.send("Display name is already exist");
      } else {
        con.query(
          "INSERT INTO `role`(`name`, `display_name`) VALUES (?,?)",
          [req.body.name, req.body.display_name],
          (err, result) => {
            if (err) throw err;
            else {
              res.status(200).json({
                error: false,
                status: true,
              });
            }
          }
        );
      }
    }
  );
});
app.post("/get-role", verifytoken, (req, res) => {
  con.query("select * from role", (err, result) => {
    if (err) throw err;
    res.status(200).json({ data: result });
  });
});
app.post("/del-role", verifytoken, (req, res) => {
  con.query("DELETE FROM `role` WHERE `id`=?", [req.body.id], (err, result) => {
    if (err) throw err;
    res.status(200).json({ error: false, status: true });
  });
});
app.post("/status-role", verifytoken, (req, res) => {
  con.query(
    "UPDATE `role` SET `status`= ? WHERE `id`=?",
    [req.body.status, req.body.id],
    (err, result) => {
      if (err) throw err;
      if (result) {
        res.status(200).send({ error: false, status: true });
      }
    }
  );
});
app.post("/update-role", verifytoken, (req, res) => {
  con.query(
    "UPDATE `role` SET `name`=?,`display_name`=? WHERE `id`=?",
    [req.body.name, req.body.dname, req.body.id],
    (err, result) => {
      if (err) throw err;
      res.status(200).json({ error: false, status: true });
    }
  );
});
app.post("/get-role-not-assign", verifytoken, (req, res) => {
  con.query("select * from role where role_assign = 'N'", (err, result) => {
    if (err) throw err;
    res.status(200).json({ data: result });
  });
});
app.post("/get-role-assign", verifytoken, (req, res) => {
  con.query("select * from role where role_assign = 'Y'", (err, result) => {
    if (err) throw err;
    res.status(200).json({ data: result });
  });
});
app.post("/add-banner",upload_banner.single("add_banner"),verifytoken,
  (req, res) => {
    con.query(
      "SELECT * FROM `banner` WHERE name=?",
      [req.body.name],
      (err, result) => {
        if (err) throw err;
        if (result[0] == null) {
          con.query(
            "INSERT INTO `banner`( `name`, `type`, `image`, `status`) VALUES (?,?,?,?)",
            [req.body.name, req.body.type, req.file.filename, "Y"],
            (err, result) => {
              if (err) throw err;
              if (result) {
                res.status(200).json({
                  status: true,
                  fileName: req.file.filename,
                  path: req.file.path,
                });
              }
            }
          );
        } else {
          res.status(404).send("Banner Name is already exist");
        }
      }
    );
  }
);
app.post("/get-banner", verifytoken, (req, res) => {
  con.query("select * from `banner`", (err, result) => {
    if (err) throw err;
    else {
      res.status(200).send({ data: result });
    }
  });
});
app.post("/del-banner", verifytoken, (req, res) => {
  con.query("DELETE FROM `banner` where id=?", [req.body.id], (err, result) => {
    if (err) throw err;
    else {
      res.status(200).send(true);
    }
  });
});
app.post("/status-banner", verifytoken, (req, res) => {
  con.query(
    "UPDATE `banner` SET `status`= ? WHERE `id`=?",
    [req.body.status, req.body.id],
    (err, result) => {
      if (err) throw err;
      if (result) {
        res.status(200).send(true);
      }
    }
  );
});
app.post("/update-banner",upload_banner.single("add_banner"),verifytoken,(req, res) => {
    con.query(
      "SELECT id FROM `banner` WHERE name=?",
      [req.body.name],
      (err, result) => {
        if (err) throw err;
        if (result[0] == null) {
          if (req.file == undefined) {
            con.query(
              "UPDATE `banner` SET `name`= ?, `type`=? WHERE `id`=?",
              [req.body.name, req.body.type, req.body.id],
              (err, result) => {
                if (err) throw err;
                if (result) {
                  res.status(200).send(true);
                }
              }
            );
          } else {
            con.query(
              "UPDATE `banner` SET `name`= ?,`type`=?,`image`= ? WHERE `id`=?",
              [req.body.name, req.body.type, req.file.filename, req.body.id],
              (err, result) => {
                if (err) throw err;
                if (result) {
                  res.status(200).send(true);
                }
              }
            );
          }
        } else {
          if (result[0].id == req.body.id) {
            con.query(
              "UPDATE `banner` SET `name`= ?,`type`=?,`image`= ? WHERE `id`=?",
              [req.body.name, req.body.type, req.file.filename, req.body.id],
              (err, result) => {
                if (err) throw err;
                if (result) {
                  res.status(200).send(true);
                }
              }
            );
          } else {
            res.status(404).send("Banner Name is already exist");
          }
        }
      }
    );
  }
);
app.post("/update-banner-name", verifytoken, (req, res) => {
  con.query(
    "SELECT id FROM `banner` WHERE name=?",
    [req.body.name],
    (err, result) => {
      if (err) throw err;
      if (result.length == 0) {
        con.query(
          "UPDATE `banner` SET `name`= ?,`type`=? WHERE `id`=?",
          [req.body.name, req.body.type, req.body.id],
          (err, result) => {
            if (err) throw err;
            if (result) {
              res.status(200).send(true);
            }
          }
        );
      } else {
        if (result[0].id == req.body.id) {
          con.query(
            "UPDATE `banner` SET `name`= ?,`type`=? WHERE `id`=?",
            [req.body.name, req.body.type, req.body.id],
            (err, result) => {
              if (err) throw err;
              if (result) {
                res.status(200).send(true);
              }
            }
          );
        } else {
          res.status(404).send("Banner Name is already exist");
        }
      }
    }
  );
});
app.post("/add-module", verifytoken, (req, res) => {
  con.query(
    "select * from module where module_name=?",
    [req.body.module_name],
    (err, result) => {
      if (err) throw err;
      if (result[0] == null) {
        con.query(
          "INSERT INTO `module`(`url`, `module_name`) VALUES (?,?)",
          [req.body.url, req.body.module_name],
          (err, result) => {
            if (err) throw err;
            else {
              res.status(200).send(true);
            }
          }
        );
      } else {
        res.send("Module name is already exist");
      }
    }
  );
});
app.post("/get-module", verifytoken, (req, res) => {
  con.query("select * from `module`", (err, result) => {
    if (err) throw err;
    else {
      res.status(200).send({ data: result });
    }
  });
});
app.post("/del-module", verifytoken, (req, res) => {
  con.query(
    "DELETE FROM `assign_module` WHERE `module`=?",
    [req.body.id],
    (err, result) => {
      if (err) throw err;
      if (result) {
        con.query(
          "DELETE FROM `module` where id=?",
          [req.body.id],
          (err, result1) => {
            if (err) throw err;
            if (result1) {
              res.status(200).send(true);
            }
          }
        );
      }
    }
  );
});
app.post("/status-module", verifytoken, (req, res) => {
  con.query(
    "UPDATE `module` SET `status`= ? WHERE `id`=?",
    [req.body.status, req.body.id],
    (err, result) => {
      if (err) throw err;
      if (result) {
        res.status(200).send(true);
      }
    }
  );
});
app.post("/update-module", verifytoken, (req, res) => {
  con.query(
    "UPDATE `module` SET `module_name`=?,`url`=? WHERE `id`=?",
    [req.body.module_name, req.body.url, req.body.id],
    (err, result) => {
      if (err) throw err;
      if (result) {
        res.status(200).send(true);
      }
    }
  );
});
app.post("/assign-module", verifytoken, (req, res) => {
  for (var module of req.body.module) {
    con.query("INSERT INTO `assign_module`(`role`, `module`) VALUES (?,?)", [
      req.body.role_id,
      module,
    ]);
  }
  con.query(
    "UPDATE `role` SET `role_assign`='Y' WHERE `id`=?",
    [req.body.role_id],
    (err, result) => {
      if (err) throw err;
      if (result) {
        res.status(200).json({
          error: false,
          status: true,
          message: "Module Assign Successfully",
        });
      }
    }
  );
});
app.post("/get-assign-module", verifytoken, (req, res) => {
  con.query(
    "SELECT am.id,m.module_name,r.display_name FROM `assign_module` am INNER join module m on am.module = m.id INNER JOIN role r on am.role = r.id WHERE am.role = ?",
    [req.body.id],
    (err, result) => {
      if (err) throw err;
      if (result) {
        res.status(200).json({
          error: false,
          status: true,
          data: result,
        });
      }
    }
  );
});
app.post("/update-assign-module", verifytoken, (req, res) => {
  con.query(
    "DELETE FROM `assign_module` WHERE `role` = ?",
    [req.body.role_id],
    (error, resultt) => {
      if (error) {
        throw error;
      }
      if (resultt) {
        for (var module of req.body.module) {
          con.query(
            "INSERT INTO `assign_module`(`role`, `module`) VALUES (?,?)",
            [req.body.role_id, module]
          );
        }
        res.status(200).json({
          error: false,
          status: true,
          message: "Module Assign Upadated Successfully",
        });
      }
    }
  );
});
app.post("/get-assign-module-id", verifytoken, (req, res) => {
  con.query(
    "SELECT am.module FROM `assign_module` am INNER join module m on am.module = m.id INNER JOIN role r on am.role = r.id WHERE am.role = ?",
    [req.body.id],
    (err, result) => {
      if (err) throw err;
      if (result) {
        res.status(200).json({
          error: false,
          status: true,
          data: result,
        });
      }
    }
  );
});
app.post("/role-assign", verifytoken, (req, res) => {
  con.query(
    "select * from `role_assign` where `user_id`=?",
    [req.body.user_id],
    (err, result) => {
      if (err) throw err;
      if (result.length > 0) {
        res.status(302).json({
          error: true,
          status: false,
          message: "User is already exist",
        });
      } else {
        con.query(
          "INSERT INTO `role_assign`(`role_id`, `user_id`) VALUES (?,?)",
          [req.body.role_id, req.body.user_id],
          (err, result) => {
            if (err) throw err;
            else {
              res.status(201).json({
                error: false,
                status: true,
                message: "Role Assign SUCCESSFULLY",
              });
            }
          }
        );
      }
    }
  );
});
app.post("/add-team", verifytoken, (req, res) => {
  con.query(
    "SELECT * FROM `team` WHERE `Team_name`=?",
    [req.body.team],
    (err, result) => {
      if (err) throw err;
      if (result.length > 0) {
        res.status(200).json({
          error: false,
          status: true,
          massage: "This Team All Ready Exist",
        });
      } else {
        con.query(
          "INSERT INTO `team`( `Team_name`) VALUES (?)",
          [req.body.team],
          (err, result) => {
            if (err) {
              throw err;
            }
            if (result) {
              res.status(200).json({
                error: false,
                status: true,
                massage: "Your Team Added SuccessFully",
              });
            }
          }
        );
      }
    }
  );
});
app.post("/get-team", verifytoken, (req, res) => {
  con.query("SELECT * FROM `team`", (err, result) => {
    if (err) throw err;
    else {
      res.status(200).send({ status: true, error: false, data: result });
    }
  });
});
app.post("/del-team", verifytoken, (req, res) => {
  con.query(
    "DELETE FROM `team` WHERE  `id`=?",
    [req.body.id],
    (err, result) => {
      if (err) {
        throw err;
      }
      if (result) {
        res.status(200).send(true);
      }
    }
  );
});
app.post("/update-team", verifytoken, (req, res) => {
  console.log(req.body);
  con.query(
    "UPDATE `team` SET `Team_name`=? WHERE `id`=?",
    [req.body.teamname, req.body.id],
    (err, result) => {
      if (err) throw err;
      if (result) {
        (err, result) => {
          if (err) throw err;
          if (result) {
            res.status(200).send(true);
          }
        }
      }
    }
  );
});
app.post("/status-team", verifytoken, (req, res) => {
  con.query(
    "UPDATE `team` SET `status`= ? WHERE `id`=?",
    [req.body.status, req.body.id],
    (err, result) => {
      if (err) throw err;
      if (result) {
        res.status(200).send(true);
      }
    }
  );
});
app.post("/add-player",upload_player.single("img"),verifytoken,(req, res) => {
    console.log(req.file);
    con.query(
      "INSERT INTO `player`(`player_name`, `image`, `age`, `player_type`, `place`) VALUES (?,?,?,?,?)",
      [
        req.body.playername,
        req.file.filename,
        req.body.age,
        req.body.player_type,
        req.body.place,
      ],
      (err, result) => {
        if (err) throw err;
        if (result) {
          res.status(200).json({
            status: true,
            error: false,
            massage: "added SuccessFully",
          });
        }
      }
    );
  }
);

app.post("/get-player", verifytoken, (req, res) => {
  con.query("SELECT * FROM `player`", (err, result) => {
    if (err) {
      throw err;
    }
    if (result) {
      res.status(200).send({ status: true, error: false, data: result });
    }
  });
});
app.post("/get-player-id", verifytoken, (req, res) => {
  con.query(
    "SELECT * FROM `player` WHERE `id`=?",
    [req.body.id],
    (err, result) => {
      if (err) {
        throw err;
      }
      if (result) {
        res.status(200).send(result);
      }
    }
  );
});
app.post("/del-player", verifytoken, (req, res) => {
  con.query(
    "DELETE FROM `player` WHERE  `id`=?",
    [req.body.id],
    (err, result) => {
      if (err) {
        throw err;
      }
      if (result) {
        res.status(200).send(true);
      }
    }
  );
});
app.post("/update-player",upload_player.single("img"),verifytoken,
  (req, res) => {
    con.query(
      "UPDATE `player` SET `player_name`=?,`image`=?,`age`=?,`player_type`=?,`place`=?,`status`=? WHERE `id`=?",
      [
        req.body.playername,
        req.file.fieldname,
        req.body.age,
        req.body.place,
        req.body.id,
      ],
      (err, result) => {
        if (err) throw err;
        if (result) {
          res.status(200).send(true);
        }
      }
    );
  }
);

app.post("/update-img-player",upload_player.single("img"),verifytoken,
  (req, res) => {
    con.query(
      "UPDATE `player` SET `image`=? WHERE `id`=?",
      [req.file.fieldname, req.body.id],
      (err, result) => {
        if (err) throw err;
        if (result) {
          res.status(200).send("Image Update SuccessFully");
        }
      }
    );
  }
);
app.post("/status-player", verifytoken, (req, res) => {
  con.query(
    "UPDATE `player` SET `status`= ? WHERE `id`=?",
    [req.body.status, req.body.id],
    (err, result) => {
      if (err) throw err;
      if (result) {
        res.status(200).send(true);
      }
    }
  );
});

app.post("/add-series", verifytoken, (req, res) => {
  console.log(req.body);
  con.query(
    "SELECT * FROM `series` WHERE `Tournament_name`=?",
    [req.body.tournamnet],
    (err, result) => {
      if (err) throw err;
      if (result.length > 0) {
        res.status(200).json({
          error: false,
          status: true,
          massage: "Tournament All Ready Organized",
        });
      } else {
        con.query(
          "INSERT INTO `series`(`Tournament_name`, `Match_type`,`series_type`,`ground_name`,`Bowl_type`) VALUES (?,?,?,?,?)",
          [
            req.body.Tournament,
            req.body.match,
            req.body.series,
            req.body.ground,
            req.body.bowl,
          ],
          (err, result) => {
            if (err) throw err;
            if (result) {
              res.status(201).json({
                error: false,
                status: true,
                massage: "Tournament Added SuccessFully",
              });
            }
          }
        );
      }
    }
  );
});
app.post("/get-series-match", verifytoken, (req, res) => {
  con.query("SELECT * FROM `series`", (err, result) => {
    if (err) throw err;
    if (result) {
      res.status(200).send({ error: false, status: true, data: result });
    }
  });
});
app.post("/del-series", verifytoken, (req, res) => {
  con.query(
    "DELETE FROM `series` WHERE  `id`=?",
    [req.body.id],
    (err, result) => {
      if (err) {
        throw err;
      }
      if (result) {
        res.status(200).send(true);
      }
    }
  );
});
app.post("/update-series", verifytoken, (req, res) => {
  con.query(
    "UPDATE `series` SET `Tournament_name`=?,`Match_type`=?,`ground_name`=?,`Bowl_type`=? WHERE `id`=?",
    [
      req.body.tournamnet,
      req.body.matchtype,
      req.body.groundname,
      req.body.bowltype,
      req.body.id,
    ],
    (err, result) => {
      if (err) {
        throw err;
      }
      if (result) {
        res.status(200).send(true);
      }
    }
  );
});
app.post("/status-series", verifytoken, (req, res) => {
  con.query(
    "UPDATE `series` SET `status`= ? WHERE `id`=?",
    [req.body.status, req.body.id],
    (err, result) => {
      if (err) throw err;
      if (result) {
        res.status(200).send(true);
      }
    }
  );
});

app.post("/add-match", verifytoken, (req, res) => {
  console.log(req.body);
  con.query(
    "SELECT * FROM `matches`WHERE `match_no`=?",
    [req.body.match],
    (err, result) => {
      if (err) throw err;
      if (result.length > 0) {
        res.status(200).json({
          error: false,
          status: true,
          massage: "Match Number all ready Exist",
        });
      } else {
        con.query(
          "INSERT INTO `matches`(`team_1`, `team_2`, `series_name`, `win_toss`, `match_no`, `result`,`date_and_time`) VALUES (?,?,?,?,?,?,?)",
          [
            req.body.team_1,
            req.body.team_2,
            req.body.seriesname,
            req.body.toss,
            req.body.match_no,
            req.body.result,
            req.body.date,
          ],
          (err, result) => {
            if (err) throw err;
            if (result) {
              res.status(201).json({
                error: false,
                status: true,
                massage: "Tournament Added SuccessFully",
              });
            }
          }
        );
      }
    }
  );
});

app.post("/get-match", verifytoken, (req, res) => {
  con.query("SELECT * FROM `matches`", (err, result) => {
    if (err) {
      throw err;
    }
    if (result) {
      res.status(200).send({ status: true, error: false, result: result });
    }
  });
});

app.post("/get-match-status", verifytoken, (req, res) => {
  con.query(
    "SELECT * FROM `matches` WHERE `id`=?",
    [req.body.id],
    (err, result) => {
      if (err) throw err;
      if (result) {
        res.status(200).send(result);
      }
    }
  );
});

app.post("/del-match", verifytoken, (req, res) => {
  con.query("DELETE FROM `matches`", (err, result) => {
    if (err) throw err;
    if (result) {
      res.status(200).send("Delete Successfully");
    }
  });
});

app.post("/update-match", verifytoken, (req, res) => {
  con.query(
    "UPDATE `matches` SET `team_1`=?,`team_2`=?,`series_name`=?,`win_toss`=?,`match_no`=?,`result`=?,`date_and_time`=? WHERE `id`=?",
    [
      req.body.team1,
      req.body.team2,
      req.body.seriesname,
      req.body.toss,
      req.body.matchno,
      req.body.result,
      req.body.date,
      req.body.id,
    ],
    (err, result) => {
      if (err) throw err;
      if (result) {
        res.status(200).send(true);
      }
    }
  );
});

app.post("/update-match-id", verifytoken, (req, res) => {
  con.query(
    "UPDATE `matches` SET `team_1`=?,`team_2`=?,`time`=?,`win_toss`=?,`match_no`=?,`result`=?,`date_and_time`=?, WHERE `series_name`=?,id`=?",
    [
      req.body.team1,
      req.body.team2,
      req.body.time,
      req.body.toss,
      req.body.matchno,
      req.body.result,
      req.body.seriesname,
      req.body.id,
    ],
    (err, result) => {
      if (err) throw err;
      if (result) {
        res.status(200).send("update successFully");
      }
    }
  );
});

app.post("/add-practice", (req, res) => {
  con.query(
    "SELECT * FROM `practice` WHERE `email`=?",
    [req.body.email],
    (err, result) => {
      if (err) throw err;
      if (result.length > 0) {
        res.status(203).json({
          error: false,
          status: true,
          massage: "Email all ready Exist",
        });
      } else {
        con.query(
          "INSERT INTO `practice`(`title`,`firstname`, `lastname`, `email`, `dob`, `password`, `confirmpassword`) VALUES (?,?,?,?,?,?,?)",
          [
            req.body.title,
            req.body.firstname,
            req.body.lastname,
            req.body.email,
            req.body.dob,
            req.body.password,
            req.body.confirmpassword,
          ],
          (err, result) => {
            if (err) throw err;
            if (result) {
              res.status(201).json({
                error: false,
                status: true,
                massage: "Account is Created SuccessFully",
              });
            }
          }
        );
      }
    }
  );
});

app.post("/get-practice",(req, res) => {
  con.query("SELECT * FROM `practice`", (err, result) => {
    if (err) {
      throw err;
    }
    if (result) {
      res.status(200).send({ status: true, error: false, data: result });
    }
  });
});

app.post("/del-practice", verifytoken, (req, res) => {
  con.query("DELETE FROM `practice` where `id`=?",[req.body.id],(err, result) => {
    if (err) throw err;
    if (result) {
      res.status(200).send("true");
    }
  });
});

app.post("/update-practice",  verifytoken, (req, res) => {
  console.log(req.body);
  con.query(
    "UPDATE `practice` SET `title`=?,`firstname`=?,`lastname`=?,`email`=?,`dob`=?,`password`=?,`confirmpassword`=?WHERE `id`=?",
    [
      req.body.title,
      req.body.firstname,
      req.body.lastname,
      req.body.email,
      req.body.dob,
      req.body.password,
      req.body.confirmpassword,
      req.body.id,
    ],
    (err, result) => {
      if (err) throw err;
      if (result) {
        res.status(200).send(true);
      }
    }
  );
});

app.post("/add-details",upload_player.single("img"), (req, res) => {
  console.log(req.body);
  con.query(
    "SELECT * FROM `details` WHERE `fname`=?",
    [req.body.fname],
    (err, result) => {
      if (err) throw err;
      if (result.length > 0) {
        res.status(200).json({
          error: false,
          status: true,
          massage: "fname all ready Exist",
        });
      } else {
        con.query(
          // const hash = bcrypt.hashSync(val.toString(), bcrypt.genSaltSync(12));
          "INSERT INTO `details`( `title`,`fname`,`email`, `phone`) VALUES (?,?,?,?)",
          [
            req.body.title,
            req.body.name,
            req.body.email,
            req.body.phone,
          ],
          (err, result) => {
            if (err) throw err;
            if (result) {
              res.status(201).json({
                error: false,
                status: true,
                massage: "Details Added SuccessFully",
              });
            }
          }
        );
      }
    }
  );
});

app.post("/get-details", verifytoken, (req, res) => {
  con.query("SELECT * FROM `details`", (err, result) => {
    if (err) {
      throw err;
    }
    if (result) {
      res.status(200).send({ status: true, error: false, result: result });
    }
  });
});

app.post("/del-details", verifytoken, (req, res) => {
  con.query("DELETE FROM `details` where `id`=?",[req.body.id],(err, result) => {
    if (err) throw err;
    if (result) {
      res.status(200).send("true");
    }
  });
});

function verifytoken(req, res, next) {
  const bearerHeader = req.headers["authorization"];
  if (typeof bearerHeader !== "undefined") {
    const bearer = bearerHeader.split(" ");
    const bearerToken = bearer[1];
    req.token = bearerToken;
    jwt.verify(req.token, process.env.ACCESS_TOKEN_SECRET, (err, auth) => {
      if (err) {
        res.sendStatus(403);
      } else {
        if (auth.username != req.body.username) {
          console.log(auth.username   +" ==== "+req.body.username);
          res.status(403).send("false");
        } else {
          next();
        }
      }
    });
  } else {
    res.sendStatus(403);
  }
}





module.exports = app;
