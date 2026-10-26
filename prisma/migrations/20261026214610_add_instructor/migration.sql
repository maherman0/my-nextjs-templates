/*
  Warnings:

  - The values [Connor] on the enum `Instructor` will be removed. If these variants are still used in the database, this will fail.

*/
-- AlterEnum
BEGIN;
CREATE TYPE "Instructor_new" AS ENUM ('Conner', 'Moore', 'Morita', 'Port');
ALTER TABLE "StudentData" ALTER COLUMN "instructor" TYPE "Instructor_new" USING ("instructor"::text::"Instructor_new");
ALTER TYPE "Instructor" RENAME TO "Instructor_old";
ALTER TYPE "Instructor_new" RENAME TO "Instructor";
DROP TYPE "public"."Instructor_old";
COMMIT;
