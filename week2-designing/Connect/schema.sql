-- entities: User, School, Company

CREATE TABLE "User"(
    "id" INTEGER,
    "email" TEXT NOT NULL UNIQUE,
    "username" TEXT NOT NULL UNIQUE, 
    "password" TEXT NOT NULL,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT,

    PRIMARY KEY("id")
);


CREATE TABLE "School"(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "founded_year" INTEGER NOT NULL,

    PRIMARY KEY("id")
);

CREATE TABLE "Company"(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "location" TEXT,
    "industry" TEXT NOT NULL,

    PRIMARY KEY("id")
);

-- relationships
CREATE TABLE "ENROLLED_AT"(
    "user_id" INTEGER,
    "school_id" INTEGER,
    "start_date" NUMBER NOT NULL,
    "end_date" NUMBER NOT NULL,
    "degree_type" TEXT NOT NULL,

    PRIMARY KEY("user_id", "school_id"),
    FOREIGN KEY("user_id") REFERENCES "User"("id"),
    FOREIGN KEY("school_id") REFERENCES "School"("id")
);

CREATE TABLE "WORKS_AT"(
    "user_id" INTEGER,
    "company_id" INTEGER,
    "start_date" NUMBER NOT NULL,
    "end_date" NUMBER NOT NULL,
    "title" TEXT NOT NULL,

    PRIMARY KEY("user_id", "company_id"),
    FOREIGN KEY("user_id") REFERENCES "User"("id"),
    FOREIGN KEY("company_id") REFERENCES "Company"("id")
);

CREATE TABLE "Connects"(
    "user_id" INTEGER,
    "user_id2" INTEGER,

    PRIMARY KEY("user_id", "user_id2"),
    FOREIGN KEY("user_id") REFERENCES "User"("id"),
    FOREIGN KEY("user_id2") REFERENCES "User"("id")
);
