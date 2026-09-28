/*1*/
select hotel.codi_hotel, hotel.nom, count(codi_reserva) as reservas
from ASIX_SL_nom.hotels hotel
inner join ASIX_SL_nom.reserves reser
ON hotel.codi_hotel = reser.codi_hotel
where hotel.categoria >=4
group by hotel.codi_hotel
having count(codi_reserva)>=150
order by reservas desc;

/*2*/
select de.nom, h.nom, avg(em.salari_base) as mitjana_sou
from empleats em
inner join departaments de
on em.codi_departament = de.codi_departament
left join hotels h
on em.codi_hotel = h.codi_hotel
where (em.tipus_contracte='indefinit')
group by de.codi_departament, h.codi_hotel
having avg(em.salari_base)>=2200
order by mitjana_sou desc;

/*3*/
select cli.nom_complet, sum(re.import_total) as total_import, count(re.codi_reserva) as total_reserva
from reserves re
inner join clients cli
on re.codi_client = cli.codi_client
where cli.vip=1 
group by cli.codi_client
having sum(re.import_total)>=3000
order by sum(re.import_total) desc;
/*4*/
select re.nom, h.nom, count(cr.codi_comanda), sum(cr.import_total) as total
from restaurant re
inner join comandes_restaurant cr
on cr.codi_restaurant = re.codi_restaurant
left join hotels h
on re.codi_hotel=h.codi_hotel
group by re.codi_restaurant
having count(cr.codi_comanda)>=200
order by sum(cr.import_total) desc;
/*5*/
select ac.nom, h.nom, count(acli.codi_client) as participants, avg(acli.valoracio) as valoracio_mitja
from activitats ac
left join hotels h
on ac.codi_hotel=h.codi_hotel
left join clients_activitats acli
on ac.codi_activitat=acli.codi_activitat
where acli.valoracio > 3 and ac.tipus IN ('aventura' , 'esport') 
group by acli.codi_activitat
having count(acli.codi_client) > 5;
/*6*/
select em.nom, de.nom, count(net.codi_empleat) as num_neteja, sum(net.temps_real) as temps_total
from empleats em
inner join departaments de
on em.codi_departament = de.codi_departament
inner join neteja net
on em.codi_empleat=net.codi_empleat
where em.horari_torn = 'matí'
group by em.codi_empleat;
/*8*/
select h.ciutat, count(DISTINCT h.codi_hotel)as nom_hotel, count(r.codi_reserva)as Numero_reserves, avg(r.import_total)as import_total
from reserves r
inner join hotels h
on r.codi_hotel=h.codi_hotel
group by h.ciutat, h.codi_hotel
having count(h.ciutat) >3 and avg(r.import_total) >500;
/*9*/
select h.tipus, count(h.nombre_habitacions) as numero_habitacions, avg(ha.preu_base) as preu_mitja, max(ha.preu_base)as preu_max
from  hotels h 
inner join habitacions ha
on h.codi_hotel=ha.codi_hotel
group by h.tipus
having count(h.nombre_habitacions) >100 and (avg(ha.preu_base) between 200 and 300);
/*10*/
select ca.nom, h.cadena_id, count(distinct h.codi_hotel), avg( h.categoria), count(e.codi_empleat)
from hotels h 
inner join cadenes_hoteleres ca
on h.cadena_id=codi_cadena
inner join empleats e
on h.codi_hotel=e.codi_hotel
group by h.cadena_id
having avg(h.categoria) >3;
/*11*/
select re.canal_reserva, year( re.data_entrada ), re.codi_reserva, re.import_total, avg( re.import_total)
from reserves re 
where avg( re.import_total) > 400
group by re.codi_reserva
having avg(re.import_total) and; 
/*12*/
select h.nom, h.tipus, r.verificada as nombreVeri, avg (r.valoracio)
from hotels h
inner join ressenyes r 
on h.codi_hotel=r.codi_hotel
where r.verificada = 1 and h.tipo in('urbà' , 'boutique')
group by r.verificada
having count(r.codi_ressenya)>30 and avg(r.valoracio) > 3.8;
/*13*/
select s.nom, COUNT(DISTINCT hs.codi_hotel) AS num_hotels, SUM(rs.import_total) AS total_ingressos, AVG(hs.preu_especial) AS preu_mitja
from serveis s 
inner join hotels_serveis hs
on s.codi_servei=hs.codi_servei
inner join reserves_serveis rs
on s.codi_servei=rs.codi_servei
where s.tipus='premium'
group by hs.codi_servei
having sum(rs.import_total) >5000;
/*14*/
select p.nom, p.categoria, r.nom, count(cp.codi_comanda) as nombre_plats
from plats p
inner join restaurant r 
on p.codi_restaurant=r.codi_restaurant
inner join comandes_plats cp
on p.codi_plat=cp.codi_plat
where p.vegetaria=1 or p.vegana=1 and p.preu > 15
group by cp.codi_plat
having count(cp.codi_comanda) >20;
/*15*/
select e.nivell, d.nom, count(e.codi_departament) as nombre_empleats, round(avg(e.salari_brut), 2) as sou_mitja, max(e.salari_brut) as sou_maxim
from empleats e
inner join departaments d 
on e.codi_departament=d.codi_departament
group by e.nivell, d.nom 
having max(e.salari_brut) > 3000 and count(e.codi_departament) >20;
/*16*/
select h.nom, ta.temporada, count(ta.codi_tarifa) as nombre_tarifa, round(avg(ta.preu), 2) as preu_mitja, max(ta.preu)
from tarifes ta 
inner join hotels h 
on ta.codi_hotel=h.codi_hotel
where ta.temporada = 'alta'
group by h.nom, ta.temporada
having avg(ta.preu) > 150 and count(ta.codi_tarifa) >10;
/*17*/
select c.nom_complet, c.nacionalitat, count(r.codi_client) as nombreReser, sum(r.nombre_nits), round(avg(r.import_habitacions),2)
from clients c 
inner join reserves r
on c.codi_client=r.codi_client
where c.nacionalitat !='spain'
group by r.codi_client
having count(r.codi_client)>=2 and round(avg(r.import_habitacions),2);
/*21*/
/*subqueris*/
/*1*/
select  concat( nom,' ', cognoms) as nom_complet, email, punts_fidelitat
from clients 
where punts_fidelitat > ( select avg(punts_fidelitat) as punts_fidelitat from clients)
order by punts_fidelitat asc;
/*2*/
select nom, ciutat, categoria
from hotels
where nombre_habitacions > ( select avg(nombre_habitacions) as habitacions from hotels)
order by nombre_habitacions desc;
/*4*/
select nom, cognoms, salari_base
from empleats
where salari_base > (select min(salari_base) from empleats);
/*11*/
select nom_complet, telefon, email
from clients
where email > (select ciutat from hotels where ciutat="Barcelona");
 /*12*/
 select nom, ciutat, telefon 
 from hotels
 where tip > (select * from serveis where tipus="premiun")