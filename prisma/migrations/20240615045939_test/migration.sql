-- CreateEnum
CREATE TYPE "SkillLevel" AS ENUM ('Beginner', 'Intermediate', 'Advanced');

-- CreateTable
CREATE TABLE "Profile" (
    "profileId" TEXT NOT NULL,
    "gender" TEXT,
    "about" TEXT,
    "professional" TEXT,
    "profileImg" TEXT NOT NULL,
    "education" TEXT,
    "address" TEXT,

    CONSTRAINT "Profile_pkey" PRIMARY KEY ("profileId")
);

-- CreateTable
CREATE TABLE "Skills" (
    "skillId" TEXT NOT NULL,
    "profileID" TEXT NOT NULL,
    "skill" TEXT NOT NULL,
    "level" "SkillLevel" NOT NULL,

    CONSTRAINT "Skills_pkey" PRIMARY KEY ("skillId")
);

-- CreateTable
CREATE TABLE "Post" (
    "postId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "postImg" TEXT NOT NULL,
    "postTitle" TEXT NOT NULL,
    "location" TEXT NOT NULL,

    CONSTRAINT "Post_pkey" PRIMARY KEY ("postId")
);

-- CreateTable
CREATE TABLE "Likes" (
    "likeId" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "projectId" TEXT NOT NULL,

    CONSTRAINT "Likes_pkey" PRIMARY KEY ("likeId")
);

-- CreateTable
CREATE TABLE "Comment" (
    "id" SERIAL NOT NULL,
    "userId" TEXT NOT NULL,
    "projectId" TEXT NOT NULL,
    "comment" TEXT NOT NULL,

    CONSTRAINT "Comment_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Likes_userId_projectId_key" ON "Likes"("userId", "projectId");

-- CreateIndex
CREATE INDEX "Comment_post_index" ON "Comment"("projectId");

-- AddForeignKey
ALTER TABLE "Profile" ADD CONSTRAINT "Profile_profileId_fkey" FOREIGN KEY ("profileId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Skills" ADD CONSTRAINT "Skills_profileID_fkey" FOREIGN KEY ("profileID") REFERENCES "Profile"("profileId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Post" ADD CONSTRAINT "Post_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Likes" ADD CONSTRAINT "Likes_projectId_fkey" FOREIGN KEY ("projectId") REFERENCES "Post"("postId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Likes" ADD CONSTRAINT "Likes_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "Comment_projectId_fkey" FOREIGN KEY ("projectId") REFERENCES "Post"("postId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comment" ADD CONSTRAINT "Comment_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE CASCADE ON UPDATE CASCADE;
