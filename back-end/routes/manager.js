const express = require("express");
const managerRouter = express.Router();
const manager = require("../middlewares/manager");
const Complaint = require("../models/complaint")
const Announcement=require("../models/announcement")

// Create a new announcement
managerRouter.post("/manager/post-announcement",manager, async (req, res) => {
  try {
    const { title, body,author , date, tag, status } = req.body;
    let announcement = new Announcement({
     title,
     body,
     author, 
     date, 
     tag, 
     status
     
    });
    announcement = await announcement.save();
    
    res.status(201).json({
        message: "Announcement created successfully",
        announcement: announcement,
      });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

  // Update an announcement by ID
  managerRouter.patch("/update/announcement/:id",manager, async (req, res) => {
    try {
      const announcement = await Announcement.findByIdAndUpdate(
        req.params.id,
        { $set: req.body },
        { new: true }
      ).exec();
      if (!announcement) {
        return res.status(404).json({ message: "Announcement not found" });
      }
  
      res.json({
        message: "Announcement updated successfully",
        announcement: announcement,
      });
    } catch (err) {
      res.json(err);
    }
  });


// Delete the announcement
managerRouter.delete("/manager/delete-announcement/:id",manager, async (req, res) => {
  try {
    const announcement = await Announcement.findByIdAndDelete(
      req.params.id,
      { $set: req.body },
      { new: true }
    ).exec();
    if (!announcement) {
      return res.status(404).json({ message: "Announcement not found" });
    }

    res.json({
      message: "Announcement deleted successfully",
      announcement: announcement,
    });
  } catch (err) {
    res.json(err);
  }
});
// move to ongoing complaints
managerRouter.patch("/ongoing/:id",manager, async (req, res) => {
  try {
    
    const complaint = await Complaint.findByIdAndUpdate(
      req.params.id,
      { $set: { status: "ongoing" } },
      { new: true }
    ).exec();
    if (!complaint) {
      return res.status(404).send({error: "Complaint not found" });
    }
    res.json({ 
      message: "Complaint status moved to ongoing",
      complaint: complaint });
  } catch (err) {
    res.status(500).send(err);
  }
});
//ongoing complaints
managerRouter.get("/ongoing-complaints",manager, async (req, res) => {
try {
  const ongoingComplaints = await Complaint.find({ status: "ongoing" }).exec();
  res.json(ongoingComplaints);
} catch (err) {
  res.status(500).send(err);
}
});

//solved-complaints

managerRouter.get("/solved-complaints",manager, async (req, res) => {
try {
  const solvedComplaints = await Complaint.find({ status: "solved" }).exec();
  res.json(solvedComplaints);
} catch (err) {
  res.status(500).send(err);
}
});


// move to solved complaints
managerRouter.patch("/solved/:id",manager, async (req, res) => {
try {
  const complaint = await Complaint.findByIdAndUpdate(
    req.params.id,
    { $set: { status: "Solved" } },
    { new: true }
  ).exec();

  if (!complaint) {
    return res.status(404).send({ error: "Complaint not found" });
  }
  
  res.status(200).json({
    message: "Complaint status moved to Solved",
    complaint: complaint,
  });
} catch (err) {
  res.status(500).send({ error: err.message });
}
});
// pending complaints
managerRouter.get("/pending-complaints",manager, async (req, res) => {
  try {
    const complaints = await Complaint.find({ status: "Pending" }).exec();
    res.json(complaints);
  } catch (err) {
    res.status(500).send(err);
  }
});

module.exports = managerRouter;
