const mongoose = require("mongoose");

mongoose.connect("mongodb://localhost/playground")
    .then(() => console.log("Connected to MongoDB..."))
    .catch(error => console.error("Could not connect to MongoDB... ", error.message));

const courseSchema = new mongoose.Schema({
    name: String,
    author: String,
    tags: [String],
    date: {type: Date, default: Date.now},
    isPublished: Boolean
});
const Course = mongoose.model("Course", courseSchema);

async function createCourse() {
    const course = new Course({
        name: "Angular Course",
        author: "Nate",
        tags: ["angular", "frontend"],
        isPublished: true
    });

    const result = await course.save();
    console.log(result);
}

async function getAllCourses() {
    const courses = await Course.find();
    console.log(courses);
}

async function getCourses(filter, limit, sort, select) {
    const courses = await Course
        .find(filter)
        .limit(limit)
        .sort(sort)
        .select(select);
    console.log(courses);
}

const filter = {author: "Nate"};
const limit = 10;
// assending order: 1
// desending order: -1
const sort = {name: 1};
const select = {name: 1, tags: 1};
getCourses(filter, limit, sort, select);

