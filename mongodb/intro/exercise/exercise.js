const mongoose = require("mongoose");

mongoose.connect("mongodb://localhost/mongo-exerises")
    .then(() => console.log("Connected to MongoDB..."))
    .catch(error => console.error("Could not connect to MongoDB... ", error.message));

const courseSchema = new mongoose.Schema({
    name: String,
    author: String,
    tags: [String],
    date: {type: Date, default: Date.now},
    isPublished: Boolean,
    price: Number
});
const Course = mongoose.model("Course", courseSchema);

async function query1() {
    const courses = await Course
        .find({isPublished: true, tags: "backend"})
        .sort({name: 1})
        .select({name: 1, author: 1});
    console.log(courses);
}

async function query2() {
    const courses = await Course
        .find({isPublished: true, tags: {$in: ["backend", "frontend"]}})
        .sort({price: -1})
        .select({name: 1, author: 1, price: 1});
    console.log(courses);
}

async function query3() {
    const courses = await Course
        .find({isPublished: true})
        .or([{price: {$gte: 15}}, {name: /.* by .*/i}])
        .sort({name: 1})
        .select({name: 1, author: 1});
    console.log(courses);
}