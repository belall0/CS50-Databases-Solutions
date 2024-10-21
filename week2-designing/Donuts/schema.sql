CREATE TABLE "Donut"(
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "price" NUMBER NOT NULL,
    "is_gluten_free" INTEGER NOT NULL,

    PRIMARY KEY("id")
);

CREATE TABLE "Ingredient"(
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "price_per_unit" NUMBER NOT NULL,

    PRIMARY KEY("id")
);

CREATE TABLE "Order"(
    "id" INTEGER,

    PRIMARY KEY("id")
);

CREATE TABLE "Customer"(
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,

    PRIMARY KEY("id")
);

-- Relationships
CREATE TABLE "Contains"(
    "donut_id" INTEGER,
    "ingredient_id" INTEGER,

    PRIMARY KEY("donut_id", "ingredient_id"),
    FOREIGN KEY("donut_id") REFERENCES "Donut"("id"),
    FOREIGN KEY("ingredient_id") REFERENCES "Ingredient"("id")
);

CREATE TABLE "Includes"(
    "order_id" INTEGER,
    "donut_id" INTEGER,

    PRIMARY KEY("order_id", "donut_id"),
    FOREIGN KEY("order_id") REFERENCES "Order"("id"),
    FOREIGN KEY("donut_id") REFERENCES "Donut"("id")
);

CREATE TABLE "Makes"(
    "order_id" INTEGER,
    "customer_id" INTEGER,
    "timestamp" NUMBER NOT NULL,

    PRIMARY KEY("order_id", "customer_id"),
    FOREIGN KEY("order_id") REFERENCES "Order"("id"),
    FOREIGN KEY("customer_id") REFERENCES "Customer"("id")
);
