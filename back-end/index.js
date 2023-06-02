const express = require("express");
const cors = require('cors');
const mongoose = require("mongoose");
const authRouter = require("./routes/auth");
const managerRouter = require("./routes/manager");
const Admin=require("./routes/admin");
const announcementRouter=require("./routes/announcement");
const complaintRouter =require("./routes/complaint");
const profileRouter =require("./routes/profile");

const app = express();
const PORT = 3000;
const mongoDB = "mongodb://localhost:27017/mobileapp";

//middleware
app.use(cors);
app.use(express.json());
app.use(authRouter);
app.use(Admin);
app.use(managerRouter);
app.use(announcementRouter);
app.use(complaintRouter);
app.use(profileRouter);

//database connection
mongoose
  .connect(mongoDB)
  .then(() => {
    console.log("database connected sucssesfully!");
  })
  .catch((e) => {
    console.log(e);
  });
app.listen(PORT, "0.0.0.0", () => {
  console.log(`connected at port ${PORT} `);
});
