--Q1: หายอดขายรวมของแต่ละสินค้าแต่ละรายการ เรียงตามลำดับไอดีของสินค้า
select items.item_id, items.item_name, sum(items.price * invoices.quantity) as Total_sales
from items
join invoices
on items.item_id = invoices.item_id
group by items.item_id
order by items.item_id;



--Q2: หายอดขายสะสมของลูกค้าแต่ละคน เรียงลำดับจากยอดขายสะสมมากไปน้อย
select c.customer_id, c.email, sum(i.price * invoices.quantity) as Cummulative_sales
from Customers c
join invoices on c.customer_id = invoices.invoice_id
join items i on invoices.item_id = i.item_id
group by c.customer_id
order by Cummulative_sales desc;



--Q3: ให้จำแนกรายการสินค้า Dairy Products หรือ Non-Dairy Products
select item_id, item_name, price, invoice_id,
case
  when item_id in (3, 4, 5, 8, 9) then 'Dairy Prodcuts'
  else 'Non-Dairy Products'
end as Product_category
from items;



--Q4: คำนวณยอดขายสินค้าประเภท Dairy Products และ Non-Dairy Products พร้อมทั้งหาสัดส่วนยอดขายของสินค้าทั้งสอง
with ProductCate as (
select item_id, item_name, price, invoice_id,
  case
    when item_id in (3, 4, 5, 8, 9) then 'Dairy Prodcuts'
    else 'Non-Dairy Products'
  end as Product_category
from items
)

select pc.product_category, sum(invoices.quantity) as total_quantity_sold,
  (sum(invoices.quantity) * 100 / (select sum(quantity) from invoices)) as percentage_sold
from ProductCate pc
join invoices on pc.item_id = invoices.item_id
group by pc.product_category;



--Q5: คำนวณยอดขายรวมของแต่ละวันในสัปดาห์ (Sunday to Saturday)
select strftime('%w', invoices.order_date) as day_week,
  sum(items.price * invoices.quantity) as Total_sales
from items
join invoices
on items.item_id = invoices.item_id
group by day_week
order by day_week;



--Q6: คำนวณยอดขายรวมแต่ละวันในสัปดาห์จำแนกตามสินค้าประเภท Dairy และ Non dairy
with ProductCate as (
    select item_id, item_name, price, invoice_id,
      case
        when item_id in (3, 4, 5, 8, 9) then 'Dairy Prodcuts'
        else 'Non-Dairy Products'
      end as Product_category
    from items
)

select strftime('%w', invoices.order_date) as day_week,
    pc.Product_category, sum(items.price * invoices.quantity) as Total_sold
from invoices
join 
    ProductCate pc on invoices.item_id = pc.item_id
join 
    items on invoices.item_id = items.item_id
group by 
    day_week, pc.Product_category
order by 
    day_week, pc.Product_category;