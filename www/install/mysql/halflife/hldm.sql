-- Moved from defaults.sql.
INSERT INTO `ps_config_events` (`id`, `gametype`, `modtype`, `eventname`, `alias`, `regex`, `idx`, `ignore`, `codefile`) 
    VALUES 
        (1,'halflife','','kill','','/^\"(.+(?:<[^>]*>))\" killed \"(.+(?:<[^>]*>))\" with \"([^\"]*)\"(.*)/',10,0,''),
        (2,'halflife','','attacked','','/^\"(.+(?:<[^>]*>))\" attacked \"(.+(?:<[^>]*>))\" with \"([^\"]+)\"(.*)/',20,1,''),
        (3,'halflife','','plrtrigger','','/^\"(.+(?:<[^>]*>))\" triggered \"([^\"]+)\"(.*)/',30,0,''),
        (4,'halflife','','round','','/^World triggered \"([^\"]+)\"(.*)/',40,0,''),
        (5,'halflife','','entered_game','','/^\"(.+(?:<[^>]*>))\" entered the game(.*)/',50,0,''),
        (6,'halflife','','joined_team','','/^\"(.+(?:<[^>]*>))\" joined team \"([^\"]+)\"/',60,0,''),
        (7,'halflife','','suicide','','/^\"(.+(?:<[^>]*>))\" committed suicide with \"([^\"]+)\"(.*)/',70,0,''),
        (8,'halflife','','changed_name','','/^\"(.+(?:<[^>]*>))\" changed name to \"([^\"]+)\"/',80,0,''),
        (9,'halflife','','connected','','/^\"(.+(?:<[^>]*>))\" connected, address \"([^\"]+)\"/',90,0,''),
        (10,'halflife','','connected_steamid','','/^\"(.+(?:<[^>]*>))\" (?:STEAM|VALVE) USERID (.+)/',100,0,''),
        (11,'halflife','','disconnected','','/^\"(.+(?:<[^>]*>))\" disconnected/',110,0,''),
        (12,'halflife','','chat','','/^\"(.+(?:<[^>]*>))\" say(_team)* \"(.*)\"?(.*)/',120,0,''),
        (13,'halflife','','rcon','','/^(Bad )?Rcon: \"rcon (-*\\d+) \"?(.*?)\"? (.+?)(?:\" from \"([^\"]+)\")?/',130,1,''),
        (14,'halflife','','cheated','','/^Secure: \"(.+(?:<[^>]*>))\" was detected cheating/',140,0,''),
        (15,'halflife','','ban','','/^(Addip|Ban(?:id)?): \"([^\"]+)\" was (?:kicked and )?(?:banned)(?: by IP)? \"([^\"]+)\" by \"([^\"]+)\"(.*)/',150,1,''),
        (16,'halflife','','unban','','/^Remove(id|ip): \"([^\"]+)\" was unbanned by \"(.+(?:<[^>]*>))\"(.*)/',160,1,''),
        (17,'halflife','','kick','','/^Kick: \"(.+(?:<[^>]*>))\" was kicked by \"(.+(?:<[^>]*>)?)\"(.*)/',170,0,''),
        (18,'halflife','','pingkick','','/^\"(.+(?:<[^>]*>))\" kicked due to high ping(.*)/',180,0,''),
        (19,'halflife','','ffkick','','/^\"(.+(?:<[^>]*>))\" has been auto kicked from the game for TKing/',190,0,''),
        (20,'halflife','','startedmap','','/^(Started|Loading) map \"([^\"]+)\"(.*)/',200,0,''),
        (21,'halflife','','logstartend','','/^Log file (started|closed)(.*)/',210,0,''),
        (22,'halflife','','ignored1','','/^[Ss]erver (?:cvars?|say|shutdown)/',220,1,''),
        (23,'halflife','','ignored2','','/^(?:\\]TSC\\[|Succeeded|FATAL|-|Loaded)/',230,1,''),
        (24,'halflife','','ignored3','','/^(?:Config|Swear|server_)/',240,1,''),
        (25,'halflife','','ignored4','','/^\"[^\"]+\" = \"/',250,1,''),
        (33,'halflife','','changed_role','','/^\"(.+(?:<[^>]*>))\" changed role to \"([^\"]+)\"/',330,0,''),
        (45,'halflife','','rcon2','','/^rcon from/',130,1,''),
        (48,'halflife','','spatial','','/^\\[KTRAJ\\] \"(.+(?:<[^>]*>))\" killed \"(.+(?:<[^>]*>))\" with \"([^\"]*)\"(.*)/',480,0,''),
        (49,'halflife','','plugin','','/^\\[[^\\]]+\\]/',490,1,''),
        (50,'halflife','','console','','/^(CONSOLE|PLAYER FILTER) :/',500,1,''),
        (100,'halflife','','ignored5','','/^Server name is \"([^"]+)\"/',1000,1,''),
        (101,'halflife','','ignored6','','/^Connection to Steam servers successful./',1010,1,''),
        (102,'halflife','','ignored7','','/^VAC secure mode is activated./',1020,1,''),
        (103,'halflife','','ignored8','','/^Assigned anonymous gameserver Steam ID \[(.:\\d:\\d+:\\d+)\]./',1030,1,''),
        (104,'halflife','','ignored9','','/^Public IP is ([0-9A-Fa-f]{1,4}:){7}[0-9A-Fa-f]{1,4}|(\\d{1,3}\.){3}\\d{1,3}./',1040,1,'');

INSERT INTO `ps_config_awards` (`id`, `enabled`, `idx`, `type`, `negative`, `class`, `name`, `groupname`, `phrase`, `expr`, `order`, `where`, `limit`, `format`, `gametype`, `modtype`, `rankedonly`, `description`) 
    VALUES 
        (4,1,10,'player',0,'','Highest Skill','','{$player.link} has the highest skill with {$award.value}','{$skill}','desc','',0,'%.02f',NULL,NULL,1,'Player with the highest skill'),
        (6,1,20,'player',0,'','Most Kills','','{$player.link} has killed the most players ({$award.value})','{$kills}','desc','',0,'commify',NULL,NULL,1,'Player with the most kills (any team)'),
        (8,1,70,'player',0,'','Most Time Online','','{$player.link} has been online the longest ({$award.value})','{$onlinetime}','desc','',25,'compacttime',NULL,NULL,1,'Player with the most online time'),
        (9,1,190,'weaponclass',0,'','Most Kills with {$weapon.class} weapons','','{$player.link} has the most {$weapon.class} kills ({$award.value})','{$kills}','desc','',0,'commify',NULL,NULL,1,'Most kills with {$weapon.class} type weapons (including: {$weapon.list}).'),
        (10,1,180,'weapon',0,'','Most Kills with {$weapon.name}','','{$player.link} has the most {$weapon.link} kills ({$award.value})','{$kills}','desc','',0,'commify',NULL,NULL,1,'Most kills with a {$weapon.name}'),
        (13,1,30,'player',0,'','Most Bonus Points','','{$player.link} achieved the most bonus points ({$award.value})','{$totalbonus}','desc','',25,'commify',NULL,NULL,1,'Player that has achieved the most bonus points.');
        
INSERT INTO `ps_config` (`id`, `conftype`, `section`, `var`, `value`, `label`, `type`, `locked`, `verifycodes`, `options`, `help`) 
    VALUES 
        (1,'main',NULL,'meta_keywords','PsychoStats Game Server Player Statistics Half-Life Death Match Valve','Site HTML Meta Key Words','text',0,'','','These are the HTML meta key words for your PsychoStats.  They are used by search engines to provide search results.');
