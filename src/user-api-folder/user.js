const express = require('express');
const app = express.Router();
const con = require('../db/conn')
var jwt = require('jsonwebtoken');
const cors = require('cors');
app.use(cors());
require("dotenv").config();
const bcrypt = require('bcrypt');
var bodyParser = require('body-parser');
var multer = require('multer');
const { diskStorage } = require('multer');
const path = require('path');
app.use(bodyParser.json({ limit: "50mb" }));
app.use(bodyParser.urlencoded({ limit: "50mb", extended: true, parameterLimit: 50000 }));

const storage = multer.diskStorage({
    destination: function (req, file, cb) {
        if (file.fieldname === "upload_logo") {
            cb(null, "image/upload_logo");
        } else if (file.fieldname === "brand_mail") {
            cb(null, "image/brand_mail");
        }
        else {
            cb(null, "image/extra_element");
        }
    },
    filename: function (req, file, cb) {
        const uniqueSuffix = Date.now() + "-" + Math.round(Math.random() * 1e9);
        cb(null, file.fieldname + "-" + uniqueSuffix + ".png");
    },
});
const upload = multer({ storage: storage });
app.post('/register', (req, res) => {
    con.query("select * from user_details where `mobile`=?", [req.body.mobile], (err, result) => {
        if (err) throw err;
        if (result.length > 0) {
            res.status(200).json({
                error: true,
                status: false,
                message: 'Mobile Number is Already Exist'
            })
        } else {
            con.query("SELECT MAX(uid) as id FROM user_details", (err, ides) => {
                if (err) throw err;
                if (result) {
                    const hash = bcrypt.hashSync(req.body.password, bcrypt.genSaltSync(12));
                    con.query("INSERT INTO `user_details`(`mobile`, `password`,`uid`) VALUES (?,?,?)", [req.body.mobile, hash, parseInt(ides[0].id) + 1], (err, result) => {
                        if (err) throw err;
                        if (result) {
                            con.query("INSERT INTO `wallet`(`mobile`, `wallet_balance`, `history`) VALUES (?,?,?)", [req.body.mobile, 0, 0]);
                            res.status(200).json({
                                error: false,
                                status: true,
                                message: 'Registered Successfully'
                            })
                        }
                    })
                }
            })
        }
    })
});
app.post('/login', (req, res) => {
    con.query("select * from user_details where mobile=?", [req.body.mobile], (err, result) => {
        if (err) throw err;
        if (result.length > 0) {
            const status = bcrypt.compareSync(req.body.password, result[0].password);
            if (status == true) {
                var token = jwt.sign({ mobile: result[0].mobile }, process.env.SECRET_KEY_USER);
                con.query("SELECT `wallet_balance` FROM `wallet` WHERE mobile=?", [req.body.mobile], (err, balance) => {
                    res.status(200).json({
                        token,
                        error: false,
                        status: true,
                        balance: balance[0].wallet_balance,
                        ID: result[0].uid,
                        username: result[0].mobile,
                        message: 'Login Successfully'
                    })
                })
            } else {
                res.status(200).json({
                    error: true,
                    message: 'Mobile Or Password is Wrong'
                })
            }
        } else {
            res.status(200).json({
                error: true,
                message: 'Mobile Number is Not Exist'
            })
        }
    })
});
app.post('/change', verifytoken, (req, res) => {
    con.query("select * from user_details where mobile=?", [req.body.mobile], (err, result) => {
        if (err) throw err;
        if (result) {
            const status = bcrypt.compareSync(req.body.password, result[0].password);
            if (status == true) {
                const hash = bcrypt.hashSync(req.body.new_password, bcrypt.genSaltSync(12));
                con.query("UPDATE `user_details` SET `password`=? WHERE `mobile`=?", [hash, req.body.mobile], (err, result) => {
                    if (err) throw err;
                    if (result) {
                        res.status(200).json({
                            error: false,
                            status: true,
                            message: 'Reset Password Successfully'
                        })
                    }
                })
            } else {
                res.status(200).json({
                    error: true,
                    message: 'Password is Wrong'
                })
            }
        }
    })
});
app.post("/wallet-balance", verifytoken, (req, res) => {
    con.query("SELECT `wallet_balance` FROM `wallet` WHERE mobile=?", [req.body.mobile], (err, result) => {
        if (err) throw err;
        if (result) {
            res.status(200).json({
                error: false,
                status: 'Success',
                data: {
                    balance: result[0].wallet_balance
                }
            })
        }
    })
})
app.post("/Deposit-balance", verifytoken, (req, res) => {
    con.query("SELECT `wallet_balance` FROM `wallet` WHERE mobile=?", [req.body.mobile], (err, result) => {
        if (err) throw err;
        if (result) {
            res.status(200).json({
                error: false,
                status: 'Success',
                data: {
                    Balance: parseInt(result[0].wallet_balance) + parseInt(req.body.balance)
                }
            })
        }
    })
})
app.post("/withdrawal-balace", (req, res) => {
    con.query("SELECT `wallet_balance` FROM `wallet` WHERE mobile=?", [req.body.mobile], (err, result) => {
        if (err) throw err;
        if (result) {
            con.query("UPDATE `wallet` SET `wallet_balance`=?, WHERE mobile=?", (req.body.wallet), (err, result) => {
                if (err) {
                    throw err;
                }
                if (result.length > 0) {
                    res.status(200).json({
                        error: false,
                        status: true,
                        msg: "your wallet is update"
                    })
                }
                else {
                    res.status(403).json({
                        error: false,
                        status: true,
                        msg: "your wallet is not a update"
                    })
                }
            })
        }
    })
})
app.post("/get-otp", (req, res) => {
    const val = Math.floor(1000 + Math.random() * 9000);
    const hash = bcrypt.hashSync(val.toString(), bcrypt.genSaltSync(12));
    // console.log(req.body);
    con.query("SELECT * FROM `otp` WHERE `number`=?", [req.body.number], (err, result) => {
        if (err) throw err;
        if (result.length > 0) {
            con.query("UPDATE `otp` SET `otp`=? WHERE `number`=?", [hash, req.body.number], (err, result) => {
                if (err) throw err;
                if (result) {
                    res.status(200).json({
                        number: req.body.number,
                        otp: val.toString()
                    })
                }
            })
        } else {
            con.query("INSERT INTO `otp`(`otp`, `number`) VALUES (?,?)", [hash, req.body.number], (err, result) => {
                if (err) throw err;
                if (result) {
                    res.status(200).json({
                        number: req.body.number,
                        otp: val.toString()
                    })
                }
            })
        }
    })
})
app.post("/verify-otp", (req, res) => {
    con.query("SELECT * FROM `otp` where number=?", [req.body.number], (err, result) => {
        if (err)
            throw err;
        if (result.length > 0) {
            const match = bcrypt.compareSync(req.body.otp, result[0].otp);
            if (match == true) {
                res.status(200).json({
                    error: false,
                    status: true,
                    msg: "Verify OTP"
                });
            }
            else {
                res.status(404).json({
                    error: true,
                    status: false,
                    msg: "Wrong OTP"
                });
            }
        }
        else {
            res.status(200).json({
                error: true,
                status: false,
                msg: "number is not exist"
            });
        }
    });
})
app.post("/get-all", (req, res) => {
    if (req.body.catId && req.body.subcatId) {
        con.query("SELECT s.id,sm.id as slugId,sm.slug AS slugname,sm.image AS slugimage,c.id as catId,c.name AS Catname,c.image AS Catimage,sc.id as subcatId,sc.name AS Subcatname,sc.image AS Subcatimage,s.status,s.createOn FROM slug_mapping s INNER JOIN sub_catagory sc ON s.subcatId =  sc.id INNER JOIN catagory c ON s.catId =  c.id INNER JOIN slug sm ON s.sugId =  sm.id where catId=? and subcatId=?", [req.body.catId, req.body.subcatId], (err, result_data) => {
            if (err) throw err;
            if (result_data) {
                var input = result_data
                var grouped = Object.values(input.reduce(function (agg, item) {

                    agg[item.catId] ??= {
                        id: item.id,
                        catId: item.catId,
                        Catname: item.Catname,
                        status: item.status,
                        createOn: item.createOn,
                        "subcat_details": {}
                    }

                    agg[item.catId]["subcat_details"][item.subcatId] ??= {
                        subcatId: item.subcatId,
                        Subcatname: item.Subcatname,
                        Subcatimage: item.Subcatimage,
                        "slug_details": []
                    }

                    agg[item.catId]["subcat_details"][item.subcatId]["slug_details"].push({
                        slugId: item.slugId,
                        slugname: item.slugname,
                        slugimage: item.slugimage,
                    })

                    return agg;
                }, {}));

                var result = grouped.map(function (item) {
                    item["subcat_details"] = Object.values(item["subcat_details"])
                    return item;
                })
                res.status(200).send(result);
            }
        })
    }
    else if (req.body.catId) {
        con.query("SELECT s.id,sm.id as slugId,sm.slug AS slugname,sm.image AS slugimage,c.id as catId,c.name AS Catname,c.image AS Catimage,sc.id as subcatId,sc.name AS Subcatname,sc.image AS Subcatimage,s.status,s.createOn FROM slug_mapping s INNER JOIN sub_catagory sc ON s.subcatId =  sc.id INNER JOIN catagory c ON s.catId =  c.id INNER JOIN slug sm ON s.sugId =  sm.id where catId=?", [req.body.catId], (err, result_data) => {
            if (err) throw err;
            if (result_data) {
                var input = result_data
                var grouped = Object.values(input.reduce(function (agg, item) {

                    agg[item.catId] ??= {
                        id: item.id,
                        catId: item.catId,
                        Catname: item.Catname,
                        status: item.status,
                        createOn: item.createOn,
                        "subcat_details": {}
                    }

                    agg[item.catId]["subcat_details"][item.subcatId] ??= {
                        subcatId: item.subcatId,
                        Subcatname: item.Subcatname,
                        Subcatimage: item.Subcatimage,
                        "slug_details": []
                    }

                    agg[item.catId]["subcat_details"][item.subcatId]["slug_details"].push({
                        slugId: item.slugId,
                        slugname: item.slugname,
                        slugimage: item.slugimage,
                    })

                    return agg;
                }, {}));

                var result = grouped.map(function (item) {
                    item["subcat_details"] = Object.values(item["subcat_details"])
                    return item;
                })
                res.status(200).send(result);
            }
        })
    }
    else if (req.body.subcatId) {
        con.query("SELECT s.id,sm.id as slugId,sm.slug AS slugname,sm.image AS slugimage,c.id as catId,c.name AS Catname,c.image AS Catimage,sc.id as subcatId,sc.name AS Subcatname,sc.image AS Subcatimage,s.status,s.createOn FROM slug_mapping s INNER JOIN sub_catagory sc ON s.subcatId =  sc.id INNER JOIN catagory c ON s.catId =  c.id INNER JOIN slug sm ON s.sugId =  sm.id where subcatId=?", [req.body.subcatId], (err, result_data) => {
            if (err) throw err;
            if (result_data) {
                var input = result_data
                var grouped = Object.values(input.reduce(function (agg, item) {

                    agg[item.catId] ??= {
                        id: item.id,
                        catId: item.catId,
                        Catname: item.Catname,
                        status: item.status,
                        createOn: item.createOn,
                        "subcat_details": {}
                    }

                    agg[item.catId]["subcat_details"][item.subcatId] ??= {
                        subcatId: item.subcatId,
                        Subcatname: item.Subcatname,
                        Subcatimage: item.Subcatimage,
                        "slug_details": []
                    }

                    agg[item.catId]["subcat_details"][item.subcatId]["slug_details"].push({
                        slugId: item.slugId,
                        slugname: item.slugname,
                        slugimage: item.slugimage,
                    })

                    return agg;
                }, {}));

                var result = grouped.map(function (item) {
                    item["subcat_details"] = Object.values(item["subcat_details"])
                    return item;
                })
                res.status(200).send(result);
            }
        })
    }
    else {
        con.query("SELECT s.id,sm.id as slugId,sm.slug AS slugname,sm.image AS slugimage,c.id as catId,c.name AS Catname,c.image AS Catimage,sc.id as subcatId,sc.name AS Subcatname,sc.image AS Subcatimage,s.status,s.createOn FROM slug_mapping s INNER JOIN sub_catagory sc ON s.subcatId =  sc.id INNER JOIN catagory c ON s.catId =  c.id INNER JOIN slug sm ON s.sugId =  sm.id;", (err, result_data) => {
            if (err) throw err;
            if (result_data) {
                var input = result_data
                var grouped = Object.values(input.reduce(function (agg, item) {

                    agg[item.catId] ??= {
                        id: item.id,
                        catId: item.catId,
                        Catname: item.Catname,
                        status: item.status,
                        createOn: item.createOn,
                        "subcat_details": {}
                    }

                    agg[item.catId]["subcat_details"][item.subcatId] ??= {
                        subcatId: item.subcatId,
                        Subcatname: item.Subcatname,
                        Subcatimage: item.Subcatimage,
                        "slug_details": []
                    }

                    agg[item.catId]["subcat_details"][item.subcatId]["slug_details"].push({
                        slugId: item.slugId,
                        slugname: item.slugname,
                        slugimage: item.slugimage,
                    })

                    return agg;
                }, {}));

                var result = grouped.map(function (item) {
                    item["subcat_details"] = Object.values(item["subcat_details"])
                    return item;
                })
                res.status(200).send(result);
            }
        })
    }
})
app.post("/get-all-subcat", (req, res) => {
    con.query("SELECT s.id,sm.id as slugId,sm.slug AS slugname,sm.image AS slugimage,sc.id as subcatId,sc.name AS Subcatname,sc.image AS Subcatimage,s.status,s.createOn FROM slug_mapping s INNER JOIN sub_catagory sc ON s.subcatId =  sc.id INNER JOIN slug sm ON s.sugId =  sm.id;", (err, result_data) => {
        if (err) throw err;
        if (result_data) {
            var input = result_data
            var grouped = Object.values(input.reduce(function (agg, item) {

                agg[item.catId] ??= {
                    "subcat_details": {}
                }

                agg[item.catId]["subcat_details"][item.subcatId] ??= {
                    subcatId: item.subcatId,
                    Subcatname: item.Subcatname,
                    Subcatimage: item.Subcatimage,
                    "slug_details": []
                }

                agg[item.catId]["subcat_details"][item.subcatId]["slug_details"].push({
                    slugId: item.slugId,
                    slugname: item.slugname,
                    slugimage: item.slugimage,
                })

                return agg;
            }, {}));

            var result = grouped.map(function (item) {
                item["subcat_details"] = Object.values(item["subcat_details"])
                return item;
            })
            res.status(200).send(result);
        }
    })
})
function verifytoken(req, res, next) {
    const bearerHeader = req.headers["authorization"];
    if (typeof bearerHeader !== "undefined") {
        const bearer = bearerHeader.split(" ");
        const bearerToken = bearer[1];
        req.token = bearerToken;
        jwt.verify(req.token, process.env.SECRET_KEY_USER, (err, auth) => {
            if (err) {
                res.sendStatus(403);
            } else {
                if (auth.username != req.body.username) {
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