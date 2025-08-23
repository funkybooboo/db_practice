const mongoose = require("mongoose");

mongoose.connect("mongodb://localhost/playground")
    .then(() => console.log("Connected to MongoDB..."))
    .catch(error => console.error("Could not connect to MongoDB... ", error.message));

const courseSchema = new mongoose.Schema({
    name: {
        type: String,
        required: true,
        minlength: 5,
        maxlength: 255,
    },
    category: {
        type: String,
        required: true,
        enum: ["web", "mobile", "network"],
        lowercase: true,
        trim: true
    },
    author: String,
    tags: {
        type: Array,
        validate: {
            validator: function (v) {
                return v && v.length > 0;
            },
            message: "A course should have at least one tag."
        }
    },
    date: {type: Date, default: Date.now},
    isPublished: Boolean,
    price: {
        type: Number,
        required: function () {
            return this.isPublished
        },
        min: 10,
        max: 200,
        get: v => Math.round(v),
        set: v => Math.round(v)
    }
});
const Course = mongoose.model("Course", courseSchema);

async function createCourse(data) {
    const course = new Course(data);
    try {
        const result = await course.save();
        console.log(result);
    } catch (error) {
        for (let feild in error.errors) console.log(error.errors[feild].message);
        console.log(error.message);
    }
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
    try {
        const result = await course.save();
        console.log(result);
    } catch (error) {
        console.log(error.message);
    }
}

async function deleteCourse(id) {
    try {
        const result = await Course.deleteOne({_id: id});
        console.log(result);
    } catch (error) {
        console.log(error.message);
    }
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
