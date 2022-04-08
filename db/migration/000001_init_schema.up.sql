CREATE TABLE "accounts" (
	"id" bigserial PRIMARY KEY,
	"owner" varchar not null,
	"balance" bigint not null,
	"currency" varchar NOT NULL,
	"created_at" timestamp NOT NULL DEFAULT (now())
);


CREATE TABLE "entries" (
	"id" bigserial PRIMARY KEY,
	"account_id"  bigint not null,
	"amount" bigint not null,
	"created_at" timestamp NOT NULL DEFAULT (now())
);
CREATE TABLE "transfers" (
	"id" bigserial PRIMARY KEY,
	"from_account_id"  bigint not null,
	"to_account_id"  bigint not null,
	"amount" bigint not null,
	"created_at" timestamp NOT NULL DEFAULT (now())
);

alter table entries add foreign key ("account_id") references "accounts" ("id");
alter table transfers add foreign key ("from_account_id") references "accounts" ("id");
alter table transfers add foreign key ("to_account_id") references "accounts" ("id");

create index on accounts ("owner");

create index on entries ("account_id");
create index on transfers ("from_account_id");
create index on transfers ("to_account_id");
create index on transfers ("from_account_id", "to_account_id");