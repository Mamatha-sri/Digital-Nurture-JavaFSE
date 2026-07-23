function CourseDetails() {

    const courses = [
        { id: 1, name: "Java Full Stack" },
        { id: 2, name: "React JS" },
        { id: 3, name: "Python" }
    ];

    return (
        <div>

            <h2>Course Details</h2>

            <ul>
                {
                    courses.map(course => (
                        <li key={course.id}>
                            {course.name}
                        </li>
                    ))
                }
            </ul>

        </div>
    );
}

export default CourseDetails;