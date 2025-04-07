create trigger tg_eklendi
on dbo.Patients
after insert
as
begin

insert into Logs(date,occassion) Values(getdate(), 'eklendi')
end

insert into Patients(patientid,patientname,patienttype)
Values
(1,'abcd','headache'),
(2,'defg','flu'),
(3,'ghj','kovit');

select*from logs

create trigger tg_guncellendi
on dbo.Patients
after update
as
begin

insert into Logs(date,occassion) values(getdate(), 'guncellendi')
end

update Patients
set patientname = 'yenieklenenhasta' 
where patientid = 3

select * from Patients
select * from logs

create trigger tg_silindi
on dbo.Patients
after delete
as
begin

insert into Logs(date,occassion) values(getdate(),'silindi')
end

delete from Patients
where patientid=1

select * from patients
select * from logs