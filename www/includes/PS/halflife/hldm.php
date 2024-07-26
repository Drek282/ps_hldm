<?php
/**
	PS::halflife::hldm
	$Id: hldm.php 506 2008-07-02 14:29:49Z lifo $

	Halflife::hldm mod support for PsychoStats front-end
*/
if (!defined("PSYCHOSTATS_PAGE")) die("Unauthorized access to " . basename(__FILE__));
if (defined("CLASS_PS_HALFLIFE_HLDM_PHP")) return 1;
define("CLASS_PS_HALFLIFE_HLDM_PHP", 1);

include_once(rtrim(dirname(__DIR__), '/\\') . '/halflife.php');

class PS_halflife_hldm extends PS_halflife {

var $class = 'PS::halflife::hldm';

var $CLAN_MODTYPES = array(
);

function __construct(&$db) {
	parent::PS_halflife($db);
	$this->CLAN_MAP_MODTYPES = $this->CLAN_MODTYPES;
}

function PS_halflife_hldm(&$db) {
    self::__construct($db);
}

function get_clan_modtypes() {
	return $this->CLAN_MODTYPES;	
}

function get_clan_map_modtypes() {
	return $this->CLAN_MAP_MODTYPES;	
}

// Add or remove columns from maps.php listing
function maps_table_mod(&$table) {
}

function map_left_column_mod(&$map, &$theme) {
	// maps and players have the same stats ...
	$this->player_left_column_mod($map, $theme);
	$theme->assign('map_left_column_mod', $theme->get_template_vars('player_left_column_mod'));
}

function clan_left_column_mod(&$clan, &$theme) {
	// clans and players have the same stats ...
	$this->player_left_column_mod($clan, $theme);
	$theme->assign('clan_left_column_mod', $theme->get_template_vars('player_left_column_mod'));
}

function player_left_column_mod(&$plr, &$theme) {
	global $cms;
	$tpl = 'player_left_column_mod';
	if ($theme->template_found($tpl, false)) {
		$theme->assign('player_left_column_mod', null);
	}
}

} // end of ps::halflife::hldm

?>
