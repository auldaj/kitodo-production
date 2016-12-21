--
-- Migration: Remove dangling data

-- 1. Check if process exists, if no, remove references to it in other tables
--
DELETE bp FROM batch_x_process AS bp LEFT JOIN process AS p ON p.id = bp.process_id WHERE p.id IS NULL;
DELETE h FROM history AS h LEFT JOIN process AS p ON p.id = h.process_id WHERE p.id IS NULL;
DELETE t FROM task AS t LEFT JOIN process AS p ON p.id = t.process_id WHERE p.id IS NULL;
DELETE t FROM template AS t LEFT JOIN process AS p ON p.id = t.process_id WHERE p.id IS NULL;
DELETE w FROM workpiece AS w LEFT JOIN process AS p ON p.id = w.process_id WHERE p.id IS NULL;

-- 2. Check if user exists, if no, change user_id in task table to NULL
--
UPDATE task SET user_id = NULL
WHERE (user_id) NOT IN (SELECT id FROM user);
