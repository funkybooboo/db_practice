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
        .select(select)
        .sort(sort);
    console.log(courses);
}

async function updateCourse(id, update) {
    const course = await Course.findById(id);
    if (!course) return;
    course.set(update);
    const result = await course.save();
    console.log(result);
}

async function deleteCourse(id) {
    const result = await Course.deleteOne({_id: id});
    console.log(result);
}

// comparison query
// eq (equal)
// ne (not equal)
// gt (greater than)
// gte (greater than or equal to)
// lt (less than)
// lte (less than or equal to)
// in (in)
// nin (not in)
// examples
// .find({price: {$lte: 10}})
// .find({price: {$gte: 10, $lte: 20}})

// logical query
// or
// and
// examples
// .find().or({author: "Nate"}, {isPublished: true})
// .find().and()

// regular expression
// /pattern/
// /^pattern/
// /pattern$/
// /.*pattern.*/

const filter = {author: "Nate"};
const limit = 10;
// assending order: 1
// desending order: -1
const sort = {name: 1};
const select = {name: 1, tags: 1};
getCourses(filter, limit, sort, select);

