const express = require('express');
const router = express.Router();
const apiController = require('../app/controllers/api/apicontroller');

router.get('/get_random_qus', apiController.fetchData);
router.get('/get_exam_qus', apiController.fetchexam);
router.post('/match_random_qus', apiController.match);
router.get('/result', apiController.result);
router.get('/getCategories', apiController.getCategories);
router.post('/getQuestionsByCategory', apiController.getQuestionsByCategory);
router.get('/getallquestions', apiController.allquestions);
router.get('/getcorrectquestions', apiController.correctquestions);
router.get('/getincorrectquestions', apiController.incorrectquestions);
router.get('/getprice', apiController.getprice);
router.post('/reportflag', apiController.reportflag);
router.post('/contact-us', apiController.contactus);

// router.get('/userdata',authenticateJWT,apiController.userdata);


module.exports = router;
