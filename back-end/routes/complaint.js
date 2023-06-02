const express = require("express");
const Complaint = require('../models/complaint');
const complaintRouter = express.Router()
complaintRouter.use(express.json())
const auth = require("../middlewares/auth");
const { body, validationResult } = require('express-validator');


const multer = require("multer");
const managerRouter = require("./manager");

const storage = multer.diskStorage({
    destination: (req,file,cb)=>{
        cb(null, './uploads');
    },
    filename:(req,file,cb)=>{
         cb(null, file.originalname);
         }
})


const upload = multer({
    storage:storage
});

complaintRouter.post("/add/image",upload.single('img'),async (req,res)=>{
 try {
    console.log(req.file.filename)
     res.json({path:req.file.originalname})  
 }
 catch (e){
     res.json({err:e})
 }
})

//complait post
managerRouter.post("/create-complaint",auth, async (req, res) => {
  try {
    if (!req.body.title) {
      return res.status(400).json({ error: 'Title is required' });
    }
    if (!req.body.description) {
      return res.status(400).json({ error: 'Description is required' });
    }
    if (!req.body.university) {
      return res.status(400).json({ error: 'University is required' });
    }
    if (!req.body.complaint_reporter) {
      return res.status(400).json({ error: 'Complaint reporter is required' });
    }

    const new_complaint = new Complaint({
      title: req.body.title,
      description: req.body.description,
      university: req.body.university,
      imageURL: req.body.imageURL,
      complain_to: req.body.complain_to,
      status: req.body.status,
      complaint_reporter: req.body.complaint_reporter, 
    });

    await new_complaint.save();

    res.json({
      complaint: new_complaint,
      success: true,
    });
  } catch (err) {
    res.status(500).json({
      message: "An unexpected error occurred",
      error: err.message,
    });
  }
});



// geting all my complaints

complaintRouter.get("/mycomplaints/:me",auth, async (req, res) => {
    try {
      const complaints = await Complaint.find({ complaint_reporter: req.params.me }).sort({ '_id': -1 });
      if (complaints.length === 0) {
        return res.json("There are currently no complaints");
      }
      res.json(complaints);
    } catch (err) {
      res.json(err);
    }
  });
  //delete
  complaintRouter.delete('/delete-complaint/:id',auth, async (req, res) => {
    try {
      const id = req.params.id;
      const complaint = await Complaint.findByIdAndDelete({ _id: id });
      if (complaint) {
        return res.status(200).json({
          message: "deleted successfully",
          deleted: complaint
        });
      }
      res.json({
        message: "We are sorry, but we were unable to find any information about the complaint you mentioned.",
      });
    } catch (err) {
      res.json(err);
    }
  });

module.exports = complaintRouter;                                                                         