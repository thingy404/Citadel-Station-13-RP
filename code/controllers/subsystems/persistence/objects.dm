/datum/subsystem/persistence/LoadPersistence()
	LoadObjects()
	return ..()

/datum/subsystem/persistence/SavePersistence()
	SaveObjects()
	return ..()

/datum/subsystem/persistence/LoadObjects()
	var/jsonfile = file("[current_map_directory]/PERSISTENCE_FILE_OBJECTS")
	var/list/data = json_decode(file2text(jsonfile))
	var/datum/element/persistence/P = SSdcs.GetElement(/datum/element/persistence)
	if(!P)
		to_chat(world, "<span class='boldwarning'>Persistence subsystem failed to grab the persistence element. !!ALL DATA WILL BE LOST AT ROUND END!!</span>")
		CRASH("FATAL: COULD NOT GRAB PERSISTENCE ELEMENT FOR OBJECT LOAD.")
	P.DeserializeAndInstantiateAll(data)

/datum/subsystem/persistence/SaveObjects()
	var/jsonfile = file("[current_map_directory]/PERSISTENCE_FILE_OBJECTS")
	var/list/data = GetObjectData()
	if(!islist(data))
		to_chat(world, "<span class='boldwarning'>Persistence subsystem failed to save objects! Object data not modified. ERROR: [data || "!UNKNOWN!"]</span>")
		CRASH("Unable to get valid object data. [data]")
	fdel(jsonfile)
	WRITE_FILE(jsonfile, json_encode(data))

/datum/subsystem/persistence/proc/GetObjectData()
	var/datum/element/persistence/P = SSdcs.GetElement(/datum/element/persistence)
	if(!P)
		return "COULD NOT FIND ELEMENT"
	var/list/returnlist = P.SerializeAll()
	if(!islist(returnlist))
		return "DID NOT GET LIST"
	return returnlist
