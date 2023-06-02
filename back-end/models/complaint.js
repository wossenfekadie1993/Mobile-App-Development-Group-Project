const req = require('express/lib/request')
const mongoose = require('mongoose')
const Schema = mongoose.Schema
const complaint_schema = mongoose.Schema({
    title: {
      type: String,
      enum: ["food", "staff", "gender", "exam"],
      required: true
    },
    university: {
      type: String,
      required: true,
      trim: true,
      default: "AAU"
    },
    description: {
      type: String
    },
    complain_to: {
      type: String,
      default: "Manager"
    },
    status: {
      type: String,
      enum: ["Pending", "solved", "ongoing"],
      default: "Pending"
    },
    complaint_reporter: {
      type: Schema.Types.ObjectId,
      default: req.user,
      ref: 'User'
    }
  });
  




complaint_schema.methods.currentuser = function (req) {
    return this.complaint_reporter >= req.user;
}
const complaint = mongoose.model("Complaint",complaint_schema)


module.exports = complaint