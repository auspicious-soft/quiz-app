const nodemailer = require('nodemailer');

const transporter = nodemailer.createTransport({
  service: 'gmail',
  auth: {
    type: 'OAuth2',
    user: "harish.auspicioussoft@gmail.com",
    pass: "harishaus@123",
    clientId: "",
    clientSecret: "",
    refreshToken: "1//04BQObK2fXgYeCgYIARAAGAQSNwF-L9Irpn1LItGorGbveX5EXChzfAOCrXwTDpNtnL9OwNl4g5NhLojZ1kOcsGFkTU0CL_zZA4g"
  }
});

const mailConfigurations = {
    from: 'mrtwinklesharma@gmail.com',
    to: 'smtwinkle451@gmail.com',
    subject: 'Sending Email using Node.js',
    text: 'Hi! There, You know I am using the NodeJS '
     + 'Code along with NodeMailer to send this email.'
};
  
transporter.sendMail(mailConfigurations, function(error, info){
    if (error) throw Error(error);
       console.log('Email Sent Successfully');
    console.log(info);
});
