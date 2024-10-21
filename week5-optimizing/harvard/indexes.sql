CREATE INDEX "student_id_enrollments_indx" ON "enrollments"("student_id");
CREATE INDEX "course_id_indx" ON "enrollments"("course_id");


CREATE INDEX "department_indx" ON "courses"("department");
CREATE INDEX "number_indx" ON "courses"("number");
CREATE INDEX "semester_indx" ON "courses"("semester");
CREATE INDEX "title_indx" ON "courses"("title");

CREATE INDEX "course_id_satisfies_indx" ON "satisfies"("course_id");
