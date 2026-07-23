import BookDetails from "./BookDetails";
import BlogDetails from "./BlogDetails";
import CourseDetails from "./CourseDetails";

function App() {

    const showBooks = true;
    const showBlogs = true;
    const showCourses = true;

    return (

        <div style={{ textAlign: "center" }}>

            <h1>Blogger App</h1>

            {showBooks && <BookDetails />}

            {showBlogs ? <BlogDetails /> : <h3>No Blogs</h3>}

            {showCourses ? <CourseDetails /> : null}

        </div>

    );

}

export default App;