#if !defined(USING_MAP_DATUM)

	#include "tether_defines.dm"
	#include "tether_turfs.dm"
	#include "tether_things.dm"
	#include "tether_phoronlock.dm"
	#include "tether_areas.dm"
	#include "tether_areas2.dm"
	#include "tether_shuttle_defs.dm"
	#include "tether_shuttles.dm"
	#include "tether_telecomms.dm"
	#include "tether_virgo3b.dm"

	#if !AWAY_MISSION_TEST //Don't include these for just testing away missions
		#include "../../_maps/map_files/tether/tether-01-surface1.dmm"
		#include "../../_maps/map_files/tether/tether-02-surface2.dmm"
		#include "../../_maps/map_files/tether/tether-03-surface3.dmm"
	#endif

	#include "submaps/_tether_submaps.dm"

	#define USING_MAP_DATUM /datum/map/tether

#elif !defined(MAP_OVERRIDE)

	#warn A map has already been included, ignoring Tether

#endif
