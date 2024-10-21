-- DONE
CREATE TABLE "Passenger" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER NOT NULL CHECK("age" > 0),

    PRIMARY KEY ("id")
);

-- DONE
CREATE TABLE "Flight" (
    "id" INTEGER,
    "flight_number" TEXT NOT NULL,
    "origin" TEXT NOT NULL,
    "destination" TEXT NOT NULL,
    "scheduled_departure" NUMERIC NOT NULL,
    "scheduled_arrival" NUMERIC NOT NULL,

    PRIMARY KEY ("id")
);

CREATE TABLE "CHECK_IN" (
    "id" INTEGER,
    "passenger_id" INTEGER NOT NULL,
    "flight_id" INTEGER NOT NULL,
    "check_in_time" NUMERIC NOT NULL,

    PRIMARY KEY ("id"),
    FOREIGN KEY ("passenger_id") REFERENCES "Passenger" ("id") FOREIGN KEY ("flight_id") REFERENCES "Flight" ("id")
);

CREATE TABLE "Airline" (
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,

    PRIMARY KEY ("id")
);

CREATE TABLE "Operating_Section" (
    "id" INTEGER,
    "name" TEXT NOT NULL CHECK("name" IN ('A', 'B', 'C', 'D', 'E', 'F', 'T')),
    "airline_id" INTEGER NOT NULL,

    PRIMARY KEY ("id"),
    FOREIGN KEY ("airline_id") REFERENCES "Airline" ("id")
);

CREATE TABLE "SERVICES" (
    "flight_id" INTEGER NOT NULL,
    "airline_id" INTEGER NOT NULL,

    PRIMARY KEY ("flight_id", "airline_id"),
    FOREIGN KEY ("flight_id") REFERENCES "Flight" ("id"),
    FOREIGN KEY ("airline_id") REFERENCES "Airline" ("id")
)