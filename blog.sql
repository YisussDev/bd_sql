CREATE DATABASE jesusblog;

CREATE TABLE "users" (
  "user_id" serial PRIMARY KEY,
  "name" varchar,
  "email" varchar,
  "genero" varchar,
  "age" integer,
  "created_user" timestamp default'now()'
);

CREATE TABLE "posts" (
  "post_id" serial PRIMARY KEY,
  "user_id" integer,
  "title" varchar,
  "description" varchar,
  "date_post" timestamp default'now()',
  "category_id" integer
);

CREATE TABLE "categories" (
  "category_id" serial PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "comments" (
  "comment_id" serial PRIMARY KEY,
  "user_id" integer,
  "post_id" integer,
  "description" varchar,
  "date_comment" timestamp default'now()'
);

ALTER TABLE "posts" ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("category_id");

ALTER TABLE "comments" ADD FOREIGN KEY ("post_id") REFERENCES "posts" ("post_id");

ALTER TABLE "comments" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("user_id");

ALTER TABLE "posts" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("user_id");
