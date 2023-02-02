CREATE USER metabase WITH PASSWORD 'password';
CREATE DATABASE metabase;
GRANT ALL PRIVILEGES ON DATABASE metabase TO metabase;



-- CREATE DATABASE stack_exchange
--     WITH
--     OWNER = postgres
--     ENCODING = 'UTF8'
--     LC_COLLATE = 'en_US.utf8'
--     LC_CTYPE = 'en_US.utf8'
--     TABLESPACE = pg_default
--     CONNECTION LIMIT = -1;

-- COMMENT ON DATABASE stack_exchange
--     IS 'Project 07';

\c metabase;


CREATE TABLE Users
(
    Id integer PRIMARY KEY,
    Reputation integer,
    CreationDate text,
    DisplayName character(50),
    LastAccessDate text,
    WebsiteUrl text,
    Location character(200),
    AboutMe text,
    Views integer,
    UpVotes integer,
    DownVotes integer,
    AccountId integer,
    Age integer,
    ProfileImageUrl text
);



CREATE TABLE badges
(
    Id integer NOT NULL PRIMARY KEY ,
    UserId integer NOT NULL ,
    Name character(50) NOT NULL,
    Date time NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Users(ID)
);



CREATE TABLE tags
(
    Id integer NOT NULL PRIMARY KEY,
    TagName character(100) unique,
    Count integer,
    ExcerptPostId integer,
    WikiPostId int
);




CREATE TABLE posts
(
    Id integer PRIMARY KEY,
    PostTypeId smallint,
    AcceptedAnswerId integer,
    CreationDate text,
    Score integer,
    ViewCount integer,
    Body text,
    OwnerUserId integer,
    LastActivityDate text,
    Title character(200),
    Tags text,
    AnswerCount integer,
    CommentCount integer,
    FavoriteCount integer,
    LastEditorUserId integer,
    LastEditDate text,
    CommunityOwnedDate text,
    ParentId integer,
    ClosedDate text,
    OwnerDisplayName character(100),
    LastEditorDisplayName character(100),
    FOREIGN KEY (OwnerUserId) REFERENCES Users(ID),
--    FOREIGN KEY (Tags) REFERENCES tags(TagName),
    FOREIGN KEY (LastEditorUserId) REFERENCES Users(ID)
);




CREATE TABLE votes
(
    Id integer PRIMARY KEY,
    PostId integer,
    VoteTypeId smallint,
    CreationDate text,
    UserId integer,
    BountyAmount integer,
    CONSTRAINT postsid FOREIGN KEY (PostId) REFERENCES posts (id),
    CONSTRAINT userid FOREIGN KEY (UserId) REFERENCES users (id)
);




CREATE TABLE comments
(
    Id integer PRIMARY KEY,
    PostId integer,
    Score integer,
    Text text,
    CreationDate text,
    UserId integer,
    UserDisplayName character(100),
    CONSTRAINT postsid FOREIGN KEY (PostId) REFERENCES posts (id),
    CONSTRAINT userid FOREIGN KEY (UserId) REFERENCES users (id)
);



CREATE TABLE postlinks
(
    Id integer PRIMARY KEY,
    CreationDate text,
    PostId integer,
    RelatedPostId integer,
    LinkTypeId smallint,
    CONSTRAINT postsid FOREIGN KEY (PostId) REFERENCES posts (id),
    CONSTRAINT RelatedPostId FOREIGN KEY (RelatedPostId) REFERENCES posts (id)
);




CREATE TABLE posthistory
(
    Id integer PRIMARY KEY,
    PostHistoryTypeId smallint,
    PostId integer,
    RevisionGUID text,
    CreationDate text,
    UserId integer,
    Text text,
    Comment text,
    UserDisplayName character(100),
    CONSTRAINT postsid FOREIGN KEY (PostId) REFERENCES posts (id),
    CONSTRAINT userid FOREIGN KEY (UserId) REFERENCES users (id)
);






create table task1(
    tag_name character(50),
    total int
);



create table kp1(
    measure_name character(50),
    total int
);


create table kp2(
    measure_name character(50),
    total int
);

create table kp3(
    measure_name character(50),
    total int
);
