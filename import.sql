create table comments(
  id integer primary key,
  body text
);

create table requests(
  id integer primary key,
  name text,
  reqUrl text,
  reqType text,
  reqHead text,
  reqBody text
);
