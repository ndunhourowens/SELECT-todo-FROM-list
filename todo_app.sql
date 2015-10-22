\c ndunhourowens;
-- 1
DROP USER IF EXISTS michael;
-- 2
CREATE USER michael WITH ENCRYPTED PASSWORD 'stonebreaker';
-- 3
DROP DATABASE if exists todo_app;
--4
CREATE DATABASE todo_app;
-- 5
\c todo_app;
-- 6/7
CREATE TABLE tasks (
  id serial PRIMARY KEY,
  title varchar(255),
  description text,
  created_at timestamp DEFAULT now(),
  updated_at timestamp DEFAULT now(),
  completed boolean DEFAULT false
);
-- 8.i.
ALTER TABLE tasks DROP COLUMN completed;
-- 8.ii.
ALTER TABLE tasks ADD COLUMN completed_at timestamp DEFAULT NULL;
-- 8.iii.
ALTER TABLE tasks
  ALTER COLUMN updated_at SET NOT NULL,
  ALTER COLUMN updated_at SET DEFAULT NULL;
-- 8.iv.
INSERT INTO tasks (title, description, created_at, updated_at, completed_at) values (
  'Study SQL',
  'Complete this exercise',
  now(),
  now(),
  NULL
);
-- 8.v.
INSERT INTO tasks (title, description, created_at, updated_at, completed_at) values (
  'Study PostgreSQL',
  'Read all the documentation',
  now(),
  now(),
  NULL
);
-- 8.vi.
-- select all the titles of tasks that are not yet completed
SELECT tasks.title, tasks.completed_at FROM tasks WHERE tasks.completed_at;
-- 8.vii.
-- update the task with a title of 'Study SQL' to be completed as of now()
UPDATE tasks SET completed_at = NOW() WHERE title = 'Study SQL';
-- 8.viii.
-- select all titles and descriptions of tasks that are not yet completed
SELECT tasks.title, tasks.descriptions FROM tasks;
-- 8.ix.
SELECT tasks.title, tasks.created_at FROM tasks ORDER BY tasks.created_at DESC;
-- 8.x.
INSERT INTO tasks (title, description, created_at, updated_at, completed_at) values (
  'mistake 1',
  'another test entry',
  now(),
  now(),
  NULL
);
-- 8.xi.
INSERT INTO tasks (title, description, created_at, updated_at, completed_at) values (
  'mistake 2',
  'another test entry',
  now(),
  now(),
  now()
);
-- 8.xii.
INSERT INTO tasks (title, description, created_at, updated_at, completed_at) values (
  'mistake 3',
  'another test entry',
  now(),
  now(),
  now()
);
-- 8.xiii.
SELECT title FROM tasks WHERE title LIKE '%mistake%';
-- 8.xiv.
-- delete the task that has a title of mistake 1
DELETE FROM tasks WHERE title = 'mistake 1';
-- 8.xv.
-- select title and description fields of all tasks with a title that includes the word 'mistake'
SELECT title, description FROM tasks WHERE title LIKE '%mistake%';

-- 8.xvi.
-- delete all tasks that includes the word 'mistake' in the title
DELETE FROM tasks WHERE title LIKE '%mistake%';

-- 8.xvii.
-- select all fields of all tasks sorted by title in ascending order
SELECT title FROM tasks ORDER BY title ASC;