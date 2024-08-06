const axios = require('axios');
const dotenv = require('dotenv');
const nodemailer = require("nodemailer");
dotenv.config();

// Function to fetch questions
const fetchData = async (req, res) => {
    const url = `${process.env.MONGO_API_URL}aggregate`;
    const apiKey = process.env.MONGO_API_KEY;
    const { user } = req.body;
    req.session.user = user;
    // console.log(req.session.user);
    let data;

    if (user == "free") {
        data = {
            collection: "fact_quiz",
            database: "quiz_db",
            dataSource: "certfast-c0",
            pipeline: [
                { $match: { "active_flag": 1, "tier_id": 4 } },
                { $limit: 20 }
            ]
        };
    } else if (user == "paid") {
        data = {
            collection: "fact_quiz",
            database: "quiz_db",
            dataSource: "certfast-c0",
            pipeline: [
                { $match: { "active_flag": 1, "tier_id": 4 } },
                { $sample: { size: 20 } }
            ]
        };
    } else if (user == "free_trial") {
        data = {
            collection: "fact_quiz",
            database: "quiz_db",
            dataSource: "certfast-c0",
            pipeline: [
                { $match: { "active_flag": 1, "tier_id": 4 } },
                { $limit: 20 }
            ]
        };
    }

    const headers = {
        'Content-Type': 'application/json',
        'api-key': apiKey
    };

    try {
        const response = await axios.post(url, data, { headers });

        if (!Array.isArray(response.data.documents)) {
            return res.status(404).json({ message: 'No data found or unexpected data format.' });
        }

        const processedData = response.data.documents.map(document => {
            let count = 0;
            let type = '';

            for (let i = 1; i <= 8; i++) {
                if (document[`answer_flag_0${i}`] === 1) {
                    count++;
                }
            }

            type = count > 1 ? 'checkbox' : 'radio';

            return {
                ...document,
                count,
                type
            };
        });
           
        res.status(200).json({ data: processedData });
    } catch (error) {
        console.error('Error fetching data:', error);
        res.status(500).json({ message: 'Error fetching data.', error });
    }
};

// Function to fetch questions
const fetchexam = async (req, res) => {
    const url = `${process.env.MONGO_API_URL}aggregate`;
    const apiKey = process.env.MONGO_API_KEY;
    const { user } = req.body;
    req.session.user = user;
    if (req.session.user == "paid") {
        data = {
            collection: "fact_quiz",
            database: "quiz_db",
            dataSource: "certfast-c0",
            pipeline: [
                { $match: { "active_flag": 1 } },
                { $match: { "tier_id": 4 } },
                { $sample: { size: 65 } }
            ]
        };
    

    const headers = {
        'Content-Type': 'application/json',
        'api-key': apiKey
    };

    try {
        const response = await axios.post(url, data, { headers });

        if (!Array.isArray(response.data.documents)) {
            return res.status(404).json({ message: 'No data found or unexpected data format.' });
        }

        const processedData = response.data.documents.map(document => {
            let count = 0;
            let type = '';

            for (let i = 1; i <= 8; i++) {
                if (document[`answer_flag_0${i}`] === 1) {
                    count++;
                }
            }

            type = count > 1 ? 'checkbox' : 'radio';

            return {
                ...document,
                count,
                type
            };
        });
           
        res.status(200).json({ data: processedData });
    } catch (error) {
        console.error('Error fetching data:', error);
        res.status(500).json({ message: 'Error fetching data.', error });
    }

}else{

    res.status(500).json({ message: 'Available only for paid users.'});
}
};

let correctAnswersCount = 0;
let incorrectAnswersCount = 0;

// Function to update results based on match endpoint response
const updateResults = (isCorrect) => {
    if (isCorrect) {
        correctAnswersCount++;
    } else {
        incorrectAnswersCount++;
    }
};
let allquestionsarray = [];
let correctquestionsarray = [];
let incorrectquestionsarray = [];
const checkAnswer = async (result) => {

 
    const data = {
        _id: result._id,
        question: result.question,
        userAnswer: result.userAnswer,
        correctAnswer: result.correctAnswer,
        isCorrect:result.isCorrect,
        explanation: result.explanation 
    };
    allquestionsarray.push(data);
    if(result.isCorrect == true){
       correctquestionsarray.push(data);
    }else if(result.isCorrect == false)
    {
     incorrectquestionsarray.push(data);
      
    }
    // console.log(data);
    // res.status(200).json(data);

};

// Function to check user answers
const match = async (req, res) => {
    const { question_id, answer, explanation } = req.body;

    if (!question_id || !answer) {
        return res.status(400).json({ message: 'Both question_id and answer are required.' });
    }

    const url = `${process.env.MONGO_API_URL}aggregate`;
    const apiKey = process.env.MONGO_API_KEY;

    const data = {
        collection: "fact_quiz",
        database: "quiz_db",
        dataSource: "certfast-c0",
        pipeline: [
            { $match: { question_id: Number(question_id) } }
        ]
    };

    const headers = {
        'Content-Type': 'application/json',
        'api-key': apiKey
    };

    try {
        const response = await axios.post(url, data, { headers });

        if (!response || !response.data || !response.data.documents || response.data.documents.length === 0) {
            return res.status(404).json({ message: 'Question not found or no matching documents.' });
        }

        const question = response.data.documents[0];
        const userAnswers = Array.isArray(answer) ? answer : [answer];

        let isCorrect = true;
        let correctAnswer = [];
        userAnswers.forEach(userAnswer => {
            let foundCorrect = false;
            for (let i = 1; i <= 8; i++) {
                if (question[`answer_flag_0${i}`] === 1 && i.toString() === userAnswer) {
                    foundCorrect = true;
                    correctAnswer.push(i);
                    break;
                }
            }
            if (!foundCorrect) {
                isCorrect = false;
            }
        });

        updateResults(isCorrect);
    
        const result = {
            _id: question._id,
            question: question.question,
            userAnswer: answer,
            correctAnswer: correctAnswer,
            isCorrect:isCorrect,
            explanation: explanation || question.explanation
        };
        checkAnswer(result);
        res.status(200).json(result);
    } catch (error) {
        console.error('Error checking answer:', error);
        res.status(500).json({ message: 'Error checking answer.', error });
    }
};

// Function to get quiz results
const result = (req, res) => {
    const notAnsweredCount = 20 - (correctAnswersCount + incorrectAnswersCount);

    const correctPercentage = (correctAnswersCount / 20) * 100;
    const incorrectPercentage = (incorrectAnswersCount / 20) * 100;
    const notAnsweredPercentage = (notAnsweredCount / 20) * 100;
    const attemptPercentage = ((correctAnswersCount + incorrectAnswersCount) / 20) * 100;

    const overallResults = {
        correctAnswers: correctAnswersCount,
        incorrectAnswers: incorrectAnswersCount,
        notAnswered: notAnsweredCount,
        attempt: correctAnswersCount + incorrectAnswersCount,
        correctPercentage: correctPercentage.toFixed(0),
        incorrectPercentage: incorrectPercentage.toFixed(0),
        notAnsweredPercentage: notAnsweredPercentage.toFixed(0),
        attemptPercentage: attemptPercentage.toFixed(0)
    };

    res.status(200).json(overallResults);
};

// Function to get categories
const getCategories = async (req, res) => {
    const url = `${process.env.MONGO_API_URL}aggregate`;
    const apiKey = process.env.MONGO_API_KEY;
    const { user } = req.body;
    req.session.user = user;
    if (req.session.user == "paid") {
    const data = {
        collection: "dim_categories",
        database: "quiz_db",
        dataSource: "certfast-c0",
        pipeline: [
            { $match: { active_flag: 1 } }
        ]
    };

    const headers = {
        'Content-Type': 'application/json',
        'api-key': apiKey
    };

    try {
        const response = await axios.post(url, data, { headers });
        res.status(200).json({ data: response.data.documents });
    } catch (error) {
        console.error('Error fetching data:', error);
        res.status(500).json({ message: 'Error fetching data.', error });
    }
}else{

    res.status(500).json({ message: 'Available only for paid users.'});
}
};


const getQuestionsByCategory = async (req, res) => {
    const { category_id, percentage } = req.body; // Extract category_id and percentage from the request body

    if (!category_id) {
        return res.status(400).json({ message: 'category_id is required.' });
    }

    if (percentage === undefined || isNaN(percentage) || percentage < 0 || percentage > 100) {
        return res.status(400).json({ message: 'Valid percentage is required (0-100).' });
    }

    const url = `${process.env.MONGO_API_URL}aggregate`;
    const apiKey = process.env.MONGO_API_KEY;

    try {
        const totalQuestions = 20;//countResponse.data.documents[0]?.totalQuestions;
        if (!totalQuestions) {
            return res.status(404).json({ message: 'No questions found for the given category.' });
        }

        // Step 2: Calculate the number of questions to sample based on the percentage
        const numQuestions = (percentage / 100) * totalQuestions;
    
        // Step 3: Fetch the calculated number of questions using the MongoDB aggregation pipeline
        const dataPipeline = [
            { $match: { category_id: Number(category_id) } },
            { $sample: { size: numQuestions } }
        ];

        const response = await axios.post(url, { collection: "fact_quiz", database: "quiz_db", dataSource: "certfast-c0", pipeline: dataPipeline }, { headers: { 'Content-Type': 'application/json', 'api-key': apiKey } });

        if (!Array.isArray(response.data.documents)) {
            return res.status(404).json({ message: 'Unexpected data format.' });
        }

        const documents = response.data.documents;
        res.status(200).json({ count: documents.length, data: documents });
    } catch (error) {
        console.error('Error fetching data:', error);
        res.status(500).json({ message: 'Error fetching data.', error });
    }
};

const allquestions = async (req, res) => {
    
    const result = allquestionsarray;
    res.status(200).json({ data: result });
};

const correctquestions = async (req, res) => {
    
    const result = correctquestionsarray;
    res.status(200).json({ data: result });
};

const incorrectquestions = async (req, res) => {
   
    const result = incorrectquestionsarray;
    res.status(200).json({ data: result});
};


const getprice = async (req, res) => {
    const url = `${process.env.MONGO_API_URL}aggregate`;
    const apiKey = process.env.MONGO_API_KEY;

    const headers = {
        'Content-Type': 'application/json',
        'api-key': apiKey
    };

    // First query to get country_id
    const countryDataQuery = {
        collection: "dim_app_country",
        database: "quiz_db",
        dataSource: "certfast-c0",
        pipeline: [
            { $match: { app_id: 1 } },
            { $match: { active_flag: 1 } }
        ]
    };

    try {
        const countryResponse = await axios.post(url, countryDataQuery, { headers });

        if (!Array.isArray(countryResponse.data.documents) || countryResponse.data.documents.length === 0) {
            return res.status(404).json({ message: 'No country data found.' });
        }

        const countryIds = countryResponse.data.documents.map(doc => doc.country_id);
        // console.log(countryIds);
        // Second query to get price data
        const priceDataQuery = {
            collection: "fact_pricing",
            database: "quiz_db",
            dataSource: "certfast-c0",
            pipeline: [
                { $match: { app_country_id: { $in: countryIds } } },
                { $match: { active_flag: 1 } }
            ]
        };

        const priceResponse = await axios.post(url, priceDataQuery, { headers });
        // console.log(priceResponse);
        if (!Array.isArray(priceResponse.data.documents)) {
            return res.status(404).json({ message: 'No price data found.' });
        }

        res.status(200).json({ data: priceResponse.data.documents });
    } catch (error) {
        console.error('Error fetching data:', error);
        res.status(500).json({ message: 'Error fetching data.', error });
    }
};
const reportflag = async (req, res) => {
    const { userEmail, userPassword, user, message } = req.body;
   
    const transporter = nodemailer.createTransport({
      service: 'gmail',
      auth: {
        user: userEmail,
        pass: userPassword
      }
    });

    const mailOptions = {
      from: userEmail,
      to: "harish.auspicioussoft@gmail.com",
      subject: 'New Report from User',
      text: `User: ${user}\n\nMessage: ${message}`
    };
  
    transporter.sendMail(mailOptions, (error, info) => {
      if (error) {
        console.log(error);
        return res.status(500).send('Error sending email');
      }
      console.log('Email sent: ' + info.response);
      res.status(200).send('Report sent successfully');
    });
};

const contactus = async (req, res) => {
const { name, email, message } = req.body;

// Validate input
if (!name || !email || !message) {
    return res.status(400).send({ message: 'All fields are required.' });
}

// Configure Nodemailer transporter
let transporter = nodemailer.createTransport({
    host: process.env.SMTP_HOST,
    port: process.env.SMTP_PORT,
    secure: process.env.SMTP_SECURE === 'true', // true for 465, false for other ports
    auth: {
        user: process.env.SMTP_USER,
        pass: process.env.SMTP_PASS
    }
});

// HTML content for the email
const htmlContent = `
<!DOCTYPE html>
<html>
<head>
<title>QuizApp.com</title>
</head>
<body>
<div style="background: #edf2f7; padding: 20px; display: flex; align-items: center;" class="thanks-page">
	<div style=" background-color: #ffffff; border-color: #e8e5ef;  border-radius: 2px;border-width: 1px;box-shadow: 0 2px 0 rgba(0, 0, 150, 0.025), 2px 4px 0 rgba(0, 0, 150, 0.015); margin: 0 auto; padding: 20px; width: 100%;  max-width: 400px; text-align: left;" class="thanks-content">
<h1 style="font-size: 24px; line-height: 28px; font-weight: 400;">Hi Admin!</h1>
<p style="font-size: 14px; line-height: 20px;">${name} sent a message from this email ${email}.</p>
<p style="font-size: 14px; line-height: 20px;">Message:${message}</p>
<p style="font-size:12px;line-height: 20px;margin-bottom: 0;">Thanks & Regards</p>
<p style="font-size:12px;line-height:20px;margin-top: 0;">Team QuizApp</p>
</div>
</div>
</body>
</html>
`;

const htmlContentuser = `
<!DOCTYPE html>
<html>
<head>
<title>QuizApp.com</title>
</head>
<body>
<div style="background: #edf2f7; padding: 20px; display: flex; align-items: center;" class="thanks-page">
	<div style=" background-color: #ffffff; border-color: #e8e5ef;  border-radius: 2px;border-width: 1px;box-shadow: 0 2px 0 rgba(0, 0, 150, 0.025), 2px 4px 0 rgba(0, 0, 150, 0.015); margin: 0 auto; padding: 20px; width: 100%;  max-width: 400px; text-align: left;" class="thanks-content">
<h1 style="font-size: 24px; line-height: 28px; font-weight: 400;">Hi ${name}</h1>
<p style="font-size: 14px; line-height: 20px;">We have received your message.Our team contact you shortly through the email you have given.</p>
<p style="font-size:12px;line-height: 20px;margin-bottom: 0;">Thanks & Regards</p>
<p style="font-size:12px;line-height:20px;margin-top: 0;">Team QuizApp</p>
</div>
</div>
</body>
</html>
`;
let mailOptions = {
    from: email,
    to: "preeti.auspicioussoft@gmail.com",
    subject: 'Contact Us Message from User.',
    // text: `Name: ${name}\nEmail: ${email}\nMessage: ${message}`,
    html:htmlContent
};

let mailOptionuser = {
    from: "preeti.auspicioussoft@gmail.com",
    to: email,
    subject: 'Message from QuizApp',
    // text: `Name: ${name}\nEmail: ${email}\nMessage: ${message}`,
    html:htmlContentuser
};

try {
    await transporter.sendMail(mailOptions);
    await transporter.sendMail(mailOptionuser);
    res.status(200).send({ message: 'Email sent successfully.' });
} catch (error) {
    console.error('Error sending email:', error);
    res.status(500).send({ message: 'Failed to send email.' });
}
};

module.exports = {
    fetchData,
    match,
    result,
    getCategories,
    getQuestionsByCategory,
    allquestions ,
    correctquestions,
    incorrectquestions,
    getprice,
    fetchexam,
    reportflag,
    contactus
};
