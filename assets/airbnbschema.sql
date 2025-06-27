CREATE TABLE "User" (
  "user_id" "UUID" UNIQUE PRIMARY KEY,
  "first_name" "VARCHAR" NOT NULL,
  "last_name" "VARCHAR" NOT NULL,
  "email" "VARCHAR" UNIQUE NOT NULL,
  "password_hash" "VARCHAR" NOT NULL,
  "phone_number" "VARCHAR",
  "role" "ENUM" NOT NULL,
  "created_at" "TIMESTAMP" DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE "Property" (
  "property_id" "UUID" UNIQUE PRIMARY KEY,
  "host_id" "UUID" NOT NULL,
  "name" "VARCHAR" NOT NULL,
  "description" "TEXT" NOT NULL,
  "location" "VARCHAR" NOT NULL,
  "pricepernight" "DECIMAL" NOT NULL,
  "created_at" "TIMESTAMP" DEFAULT (CURRENT_TIMESTAMP),
  "updated_at" "TIMESTAMP"
);

CREATE TABLE "Booking" (
  "booking_id" "UUID" UNIQUE PRIMARY KEY,
  "property_id" "UUID" NOT NULL,
  "user_id" "UUID" NOT NULL,
  "start_date" "DATE" NOT NULL,
  "end_date" "DATE" NOT NULL,
  "total_price" "DECIMAL" NOT NULL,
  "status" "ENUM" NOT NULL,
  "created_at" "TIMESTAMP" DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE "Payment" (
  "payment_id" "UUID" UNIQUE PRIMARY KEY,
  "booking_id" "UUID" NOT NULL,
  "amount" "DECIMAL" NOT NULL,
  "payment_date" "TIMESTAMP" DEFAULT (CURRENT_TIMESTAMP),
  "payment_method" "ENUM" NOT NULL
);

CREATE TABLE "Review" (
  "review_id" "UUID" UNIQUE PRIMARY KEY,
  "property_id" "UUID" NOT NULL,
  "user_id" "UUID" NOT NULL,
  "rating" "INTEGER" NOT NULL,
  "comment" "TEXT" NOT NULL,
  "created_at" "TIMESTAMP" DEFAULT (CURRENT_TIMESTAMP)
);

CREATE TABLE "Message" (
  "message_id" "UUID" UNIQUE PRIMARY KEY,
  "sender_id" "UUID" NOT NULL,
  "recipient_id" "UUID" NOT NULL,
  "message_body" "TEXT" NOT NULL,
  "sent_at" "TIMESTAMP" DEFAULT (CURRENT_TIMESTAMP)
);

COMMENT ON COLUMN "User"."role" IS 'guest, host, admin';

COMMENT ON COLUMN "Property"."updated_at" IS 'ON UPDATE CURRENT_TIMESTAMP';

COMMENT ON COLUMN "Booking"."status" IS 'pending, confirmed, canceled';

COMMENT ON COLUMN "Payment"."payment_method" IS 'credit_card, paypal, stripe';

COMMENT ON COLUMN "Review"."rating" IS '1 to 5 only';

ALTER TABLE "Property" ADD FOREIGN KEY ("host_id") REFERENCES "User" ("user_id");

ALTER TABLE "Booking" ADD FOREIGN KEY ("property_id") REFERENCES "Property" ("property_id");

ALTER TABLE "Booking" ADD FOREIGN KEY ("user_id") REFERENCES "User" ("user_id");

ALTER TABLE "Payment" ADD FOREIGN KEY ("booking_id") REFERENCES "Booking" ("booking_id");

ALTER TABLE "Review" ADD FOREIGN KEY ("property_id") REFERENCES "Property" ("property_id");

ALTER TABLE "Review" ADD FOREIGN KEY ("user_id") REFERENCES "User" ("user_id");

ALTER TABLE "Message" ADD FOREIGN KEY ("sender_id") REFERENCES "User" ("user_id");

ALTER TABLE "Message" ADD FOREIGN KEY ("recipient_id") REFERENCES "User" ("user_id");
