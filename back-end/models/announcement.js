const mongoose = require('mongoose');

const announcementSchema = new mongoose.Schema({
  title: {
    type: String,
    required: true
  },
  body: {
    type: String,
    required: true
  },
  author: {
    type: String,
    required: true,
    default:'Manager'
  },
  date: {
    type: Date,
    default: Date.now
  },
  // tag: {
  //   type: [String],
  //   required: true
  // },
  // status: {
  //   type: String,
  //   enum: ['draft', 'published'],
  //   default: 'draft'
  // }
});

const Announcement = mongoose.model('Announcement', announcementSchema);

module.exports = Announcement;
