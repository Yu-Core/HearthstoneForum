SELECT m.*,u.uUsername,isnull(final.uUsername,u.uUsername) finaluser,isnull(final.Datatime,m.Datatime) finaltime
FROM tb_User u,
(
	SELECT m.Id,max(u.uUsername) uUsername,Max(c.Datatime) Datatime
	FROM  tb_Motif m
	left join tb_Comment c on c.mId = m.Id
	left join  tb_User u on c.uId = u.uId
	group by m.Id		
) final,
(
	SELECT t1.Id,t1.Appearuser,t1.Areaid,t1.mName,t1.Datatime,t1.Views FROM tb_Motif t1, 
	(
		SELECT TOP 16 Id FROM 
		(
			SELECT TOP 32 Id, Datatime FROM tb_Motif ORDER BY Datatime DESC, Id DESC
		) t ORDER BY t.Datatime ASC, t.Id ASC
	) t2 
	WHERE t1.Id = t2.Id 
) m
where m.Appearuser = u.uId and m.Id = final.Id
ORDER BY isnull(final.Datatime,m.Datatime) desc
