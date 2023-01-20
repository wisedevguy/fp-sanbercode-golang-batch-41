-- +migrate Up
-- +migrate StatementBegin
CREATE TABLE "user" (
  "username" varchar(100) PRIMARY KEY,
  "password" varchar(250) NOT NULL,
  "full_name" varchar(50) NOT NULL,
  "saldo" int NOT NULL,
  "role" varchar(10) NOT NULL
);

CREATE TABLE "transaksi" (
  "id_transaksi" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "user" varchar(100) UNIQUE NOT NULL,
  "tanggal" timestamp NOT NULL,
  "keterangan" varchar(250) NOT NULL,
  "total_transaksi" int NOT NULL,
  "total_bayar" int NOT NULL,
  "status_bayar" varchar(10) NOT NULL
);

CREATE TABLE "transaksi_detail" (
  "id_transaksi_detail" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "id_transaksi" int UNIQUE NOT NULL,
  "id_item" int UNIQUE NOT NULL,
  "harga" int NOT NULL,
  "qty" int NOT NULL,
  "total" int NOT NULL
);

CREATE TABLE "item" (
  "id_item" INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
  "nama_item" varchar(100) NOT NULL,
  "harga_item" int NOT NULL
);

ALTER TABLE "transaksi" ADD FOREIGN KEY ("user") REFERENCES "user" ("username");

ALTER TABLE "transaksi_detail" ADD FOREIGN KEY ("id_transaksi") REFERENCES "transaksi" ("id_transaksi");

ALTER TABLE "transaksi_detail" ADD FOREIGN KEY ("id_item") REFERENCES "item" ("id_item");

-- +migrate StatementEnd