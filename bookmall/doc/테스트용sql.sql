-- bookshop

-- schema 확인

desc book;
desc author;

-- AuthorDao : insert
insert 
	into author 
    values(null, '원수연');
    
-- select author
select *
	from author;

-- BookDao : insert
insert into book values(null, 'title', '재고있음', 1); 

-- BookDao:findAll
select a.no, a.title, b.name, a.author_no, a.statcode
		from book a, author b
        where a.author_no = b.no
        order by no asc;