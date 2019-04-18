select division.division_name,count(member.division_id) from division join member on division.division_id=member.division_id group by division.division_id
