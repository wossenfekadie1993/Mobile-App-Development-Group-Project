const express = require("express");
const announcementRouter = express.Router();
const auth = require("../middlewares/auth");
const { Announcement } = require("../models/announcement");

announcementRouter.get("/announcements/", auth, async (req, res) => {
  try {
    const announcements = await Announcement.find({ title: req.query.body });
    res.json(announcements);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// create a get request to search products and get them
// /api/products/search/i
announcementRouter.get("/announcements/search/:name", auth, async (req, res) => {
  try {
    const announcements = await Announcement.find({
      name: { $regex: req.params.title, $options: "i" },
    });

    res.json(products);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});



module.exports = announcementRouter;
