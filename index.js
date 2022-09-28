// get started
console.log("hello fello");
const express = require("express");
const mongoose = require("mongoose");
const PORT = 3000;
const authRouter = require("./src/routes/auth");
const DB = "mongodb+srv://felo:felo2590@cluster0.ikhfv6q.mongodb.net/?retryWrites=true&w=majority";


//initialize express ---(1)

const app = express();
app.use(express.json())
app.use(authRouter);

//connect to mongodb
mongoose.connect(DB).then(() => {
    console.log('connection successful');

})
    .catch((e) => {
        console.log(e);
    });

app.listen(PORT, "0.0.0.0",() => {
    console.log(`connected at port ${PORT}`)
},);

