const mongoose = require('mongoose')

const notesSchema = mongoose.Schema(
    {
        title:{
            type:String,
        },
        description:{
            type:String,
        },
        Time:{
            type: Date,
            default: Date.now,
        },
        User:{
            type:String
        }
    }
)

module.exports = mongoose.model("notesModel",notesSchema)