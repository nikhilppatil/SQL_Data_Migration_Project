
select Mobile, length(mobile) as length_mobile,
	case
		when mobile is not null 
			and  length(Mobile) = 10
		Then "valid"
        else "invalid"
end as mobile_status, 
row_number() over(order by mobile) as count_sal
from `employee data`;

select Mobile, length(mobile) as length_mobile,
	case
		when mobile REGEXP '^[6-9][0-9]{9}$'
		Then "valid"
        else "invalid"
end as mobile_status, 
row_number() over(order by mobile) as count_sal
from `employee data`;

select name, gender, length(mobile) mobile
from `employee data`;