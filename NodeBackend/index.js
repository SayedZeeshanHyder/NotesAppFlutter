const express = require('express');
const mongoose = require('mongoose');
const body_parser = require('body-parser')
const notesmodel = require('./notesmodel');

const app = express();
const PORT = 3000;

// Middleware
app.use(express.json());
app.use(body_parser.json())

mongoose.connect("mongodb://localhost:27017/notesdb").then(() => {
    console.log("MongoDB Connected");

    app.get('/', (req, resp) => {
        resp.json({"message":"Api is Live Now"})
    });

    app.get('/allnotes/:userId',async (req,resp)=>{
        console.log(req.params.userId)
        const userNotes = await notesmodel.find({"User":req.params.userId})
        resp.json(userNotes)
    })

    app.post('/update/:id',async (req,resp)=>{

        const deletedNote = await notesmodel.deleteOne({"_id":req.params.id})
        const notes = new notesmodel(req.body)
        await notes.save();
        resp.json({"message":"Successfully Updated Note"})
    
    })
    
    app.post('/insert',async (req,resp)=>{
    
        console.log(req.body)
        const notes = new notesmodel(req.body)
        await notes.save()
        resp.json({"message":"Note Inserted Successfully"})
    
    })
    
    
    app.post('/delete/:id',async (req,resp)=>{
    
        console.log(`Id: ${req.params.id}`)
        const notes = await notesmodel.deleteOne({ "_id": `${req.params.id}` })
        resp.json({"message":"Successfully Deleted Note"})
    
    }) 

    app.get('/allnotes',async (req,resp)=>{
        const notes = await notesmodel.find()
        resp.json(notes)
    })

    app.listen(PORT, () => {
        console.log("Server Active");
    });

})