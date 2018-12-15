exports.handleRequest = function(requestData, callback) { 
    var responseData = { received_as_input: requestData };
    responseData = {
	"buildings": [
					{
					 "name" : "Armstrong Hall",
					 "address" : "1100 S. McAllister Ave, Tempe, AZ 85281",
					 "floors" : [
					 				{
					 				  "number" : 1,
					 				  "classrooms": [
					 				  					{
					 				  					  "number" : "100",
					 				  					  "id"   : "ARM100"
					 				  					},
					 				  					{
					 				  					  "number" : "101",
					 				  					  "id"   : "ARM101"
					 				  					},
					 				  					{
					 				  					  "number" : "102",
					 				  					  "id"   : "ARM102"
					 				  					},
					 				  					{
					 				  					  "number" : "103",
					 				  					  "id"   : "ARM103"
					 				  					},
					 				  					{
					 				  					  "number" : "104",
					 				  					  "id"   : "ARM104"
					 				  					},
					 				  					{
					 				  					  "number" : "105",
					 				  					  "id"   : "ARM105"
					 				  					},
					 				  					{
					 				  					  "number" : "106",
					 				  					  "id"   : "ARM106"
					 				  					},
					 				  					{
					 				  					  "number" : "107",
					 				  					  "id"   : "ARM107"
					 				  					},
					 				  					{
					 				  					  "number" : "108",
					 				  					  "id"   : "ARM108"
					 				  					},
					 				  					{
					 				  					  "number" : "109",
					 				  					  "id"   : "ARM109"
					 				  					},
					 				  					{
					 				  					  "number" : "110",
					 				  					  "id"   : "ARM110" 
					 				  					}
					 				  					]
					 				},
					 				{
					 				  "number" : 2,
					 				  "classrooms": [
					 				  					{
					 				  					  "number" : "204",
					 				  					  "id"   : "ARM204"
					 				  					},
					 				  					{
					 				  					  "number" : "208",
					 				  					  "id"   : "ARM208"
					 				  					},
					 				  					{
					 				  					  "number" : "212",
					 				  					  "id"   : "ARM212"
					 				  					},
					 				  					{
					 				  					  "number" : "216",
					 				  					  "id"   : "ARM216"
					 				  					},
					 				  					{
					 				  					  "number" : "220",
					 				  					  "id"   : "ARM220"
					 				  					},
					 				  					{
					 				  					  "number" : "224",
					 				  					  "id"   : "ARM224"
					 				  					},
					 				  					{
					 				  					  "number" : "228",
					 				  					  "id"   : "ARM228"
					 				  					},
					 				  					{
					 				  					  "number" : "230",
					 				  					  "id"   : "ARM230"
					 				  					},
					 				  					{
					 				  					  "number" : "232",
					 				  					  "id"   : "ARM232"
					 				  					},
					 				  					{
					 				  					  "number" : "236",
					 				  					  "id"   : "ARM236"
					 				  					},
					 				  					{
					 				  					  "number" : "240",
					 				  					  "id"   : "ARM240" 
					 				  					}
					 				  					]
					 				}

					 				]
					},
					{
					 "name" : "COOR Hall",
					 "address" : "976 S Forest Mall, Tempe, AZ 85281",
					 "floors" : [
					 				{
					 				  "number" : 1,
					 				  "classrooms": [
					 				  					{
					 				  					 "number" : "168",
					 				  					  "id"   : "COOR168" 
					 				  					},
					 				  					{
					 				  					 "number" : "170",
					 				  					  "id"   : "COOR170" 
					 				  					},
					 				  					{
					 				  					 "number" : "174",
					 				  					  "id"   : "COOR174"
					 				  					},
					 				  					{
					 				  					 "number" : "182",
					 				  					  "id"   : "COOR182" 
					 				  					},
					 				  					{
					 				  					 "number" : "186",
					 				  					  "id"   : "COOR186" 
					 				  					},
					 				  					{
					 				  					 "number" : "190",
					 				  					  "id"   : "COOR190" 
					 				  					}
					 				  					]
					 				},
					 				{
					 				  "number" : 2,
					 				  "classrooms": [
					 				  					{
					 				  					  "number" : "274",
					 				  					  "id"   : "COOR274"
					 				  					},
					 				  					{
					 				  					  "number" : "270",
					 				  					  "id"   : "COOR270" 
					 				  					}
					 				  					]
					 				},
					 				{
					 				  "number" : 3,
					 				  "classrooms": [
					 				  					{
					 				  					  "number" : "305",
					 				  					  "id"   : "COOR305"
					 				  					},
					 				  					{
					 				  					  "number" : "323",
					 				  					  "id"   : "COOR323" 
					 				  					}
					 				  					]
					 				},
					 				{
					 				  "number" : 4,
					 				  "classrooms": [
					 				  					{
					 				  					  "number" : "472",
					 				  					  "id"   : "COOR472"
					 				  					},
					 				  					{
					 				  					  "number" : "480",
					 				  					  "id"   : "COOR480" 
					 				  					}
					 				  					]
					 				},
					 				{
					 				  "number" : 5,
					 				  "classrooms": [
					 				  					{
					 				  					  "number" : "504",
					 				  					  "id"   : "COOR504"
					 				  					},
					 				  					{
					 				  					  "number" : "570",
					 				  					  "id"   : "COOR570" 
					 				  					}
					 				  					]
					 				}
					 				]
					},
					{
					 "name" : "Design South",
					 "address" : "Design South, 850 S Forest Mall, Tempe, AZ 85281",
					 "floors" : [
					 				{
					 				  "number" : 0,
					 				  "classrooms": [
					 				  					{
					 				  					  "number" : "68",
					 				  					  "id"   : "CDN68"
					 				  					},
					 				  					{
					 				  					  "number" : "72",
					 				  					  "id"   : "CDN72" 
					 				  					}
					 				  					]
					 				},
					 				{
					 				  "number" : 1,
					 				  "classrooms": [
					 				  					{
					 				  					  "number" : "170",
					 				  					  "id"   : "CDN170"
					 				  					},
					 				  					{
					 				  					  "number" : "172",
					 				  					  "id"   : "CDN172" 
					 				  					}
					 				  					]
					 				}
					 				]
					},
					{
					 "name" : "Engineering Center F",
					 "address" : "951 Palm Walk F Wing, Tempe, AZ 85287",
					 "floors" : [
					 				{
					 				  "number" : 1,
					 				  "classrooms": [
					 				  					{
					 				  					  "number" : "101",
					 				  					  "id"   : "ECF101"
					 				  					},
					 				  					{
					 				  					  "number" : "102",
					 				  					  "id"   : "ECF102" 
					 				  					},
					 				  					{
					 				  					  "number" : "105",
					 				  					  "id"   : "ECF105" 
					 				  					},
					 				  					{
					 				  					  "number" : "109",
					 				  					  "id"   : "ECF109" 
					 				  					},
					 				  					{
					 				  					  "number" : "114",
					 				  					  "id"   : "ECF114" 
					 				  					}
					 				  					]
					 				},
					 				{
					 				  "number" : 2,
					 				  "classrooms": [
					 				  					{
					 				  					  "number" : "214",
					 				  					  "id"   : "ECF214"
					 				  					},
					 				  					{
					 				  					  "number" : "224",
					 				  					  "id"   : "ECF224"
					 				  					},
					 				  					{
					 				  					  "number" : "228",
					 				  					  "id"   : "ECF228"
					 				  					},
					 				  					{
					 				  					  "number" : "242",
					 				  					  "id"   : "ECF242"
					 				  					},
					 				  					{
					 				  					  "number" : "264",
					 				  					  "id"   : "ECF264"
					 				  					}
					 				  					]
					 				}
					 				]
					},
					{
					 "name" : "Engineering Center G",
					 "address" : "501 E Tyler Mall, Tempe, AZ 85281",
					 "floors" : [
					 				{
					 				  "number" : 1,
					 				  "classrooms": [
					 				  					{
					 				  					  "number" : "101",
					 				  					  "id"   : "ECG101"
					 				  					},
					 				  					{
					 				  					  "number" : "102",
					 				  					  "id"   : "ECG102" 
					 				  					},
					 				  					{
					 				  					  "number" : "105",
					 				  					  "id"   : "ECG105" 
					 				  					},
					 				  					{
					 				  					  "number" : "109",
					 				  					  "id"   : "ECG109" 
					 				  					},
					 				  					{
					 				  					  "number" : "114",
					 				  					  "id"   : "ECG114" 
					 				  					}
					 				  					]
					 				},
					 				{
					 				  "number" : 2,
					 				  "classrooms": [
					 				  					{
					 				  					  "number" : "204",
					 				  					  "id"   : "ECG204"
					 				  					},
					 				  					{
					 				  					  "number" : "224",
					 				  					  "id"   : "ECG224"
					 				  					},
					 				  					{
					 				  					  "number" : "232",
					 				  					  "id"   : "ECG232"
					 				  					},
					 				  					{
					 				  					  "number" : "242",
					 				  					  "id"   : "ECG242"
					 				  					},
					 				  					{
					 				  					  "number" : "264",
					 				  					  "id"   : "ECG264"
					 				  					},
					 				  					{
					 				  					  "number" : "270",
					 				  					  "id"   : "ECG270" 
					 				  					}
					 				  					]
					 				},
					 				{
					 				  "number" : 3,
					 				  "classrooms": [
					 				  					{
					 				  					  "number" : "302",
					 				  					  "id"   : "ECG302"
					 				  					},
					 				  					{
					 				  					  "number" : "308",
					 				  					  "id"   : "ECG308"
					 				  					},
					 				  					{
					 				  					  "number" : "312",
					 				  					  "id"   : "ECG312"
					 				  					},
					 				  					{
					 				  					  "number" : "313",
					 				  					  "id"   : "ECG313"
					 				  					},
					 				  					{
					 				  					  "number" : "320",
					 				  					  "id"   : "ECG320"
					 				  					},
					 				  					{
					 				  					  "number" : "337",
					 				  					  "id"   : "ECG337" 
					 				  					}
					 				  					]
					 				}
					 				]
					},
					{
					 "name" : "NEEB Hall",
					 "address" : "L. S. Neeb Hall, 920 S Forest Mall, Tempe, AZ 85281",
					 "floors" : [
					 				{
					 				  "number" : 1,
					 				  "classrooms": [
					 				  					{
					 				  					  "number" : "105",
					 				  					  "id"   : "NEEB105"
					 				  					},
					 				  					{
					 				  					  "number" : "144",
					 				  					  "id"   : "NEEB144" 
					 				  					}
					 				  					]
					 				},
					 				{
					 				  "number" : 2,
					 				  "classrooms": [
					 				  					{
					 				  					  "number" : "210",
					 				  					  "id"   : "NEEB210"
					 				  					},
					 				  					{
					 				  					  "number" : "270",
					 				  					  "id"   : "NEEB270" 
					 				  					}
					 				  					]
					 				},
					 				{
					 				  "number" : 3,
					 				  "classrooms": [
					 				  					{
					 				  					  "number" : "303",
					 				  					  "id"   : "NEEB303"
					 				  					},
					 				  					{
					 				  					  "number" : "310",
					 				  					  "id"   : "NEEB310" 
					 				  					}
					 				  					]
					 				}
					 				]
					},
					{
					 "name" : "Physical Sciences H",
					 "address" : "525 E. University Dr, Tempe, AZ 85281",
					 "floors" : [
					 				{
					 				  "number" : 1,
					 				  "classrooms": [
					 				  					{
					 				  					  "number" : "150",
					 				  					  "id"   : "PSH150"
					 				  					},
					 				  					{
					 				  					  "number" : "151",
					 				  					  "id"   : "PSH151" 
					 				  					},
					 				  					{
					 				  					  "number" : "152",
					 				  					  "id"   : "PSH152"
					 				  					},
					 				  					{
					 				  					  "number" : "153",
					 				  					  "id"   : "PSH153" 
					 				  					}
					 				  					]
					 				},
					 				{
					 				  "number" : 2,
					 				  "classrooms": [
					 				  					{
					 				  					  "number" : "250",
					 				  					  "id"   : "PSH250"
					 				  					},
					 				  					{
					 				  					  "number" : "251",
					 				  					  "id"   : "PSH251" 
					 				  					},
					 				  					{
					 				  					  "number" : "252",
					 				  					  "id"   : "PSH252"
					 				  					},
					 				  					{
					 				  					  "number" : "253",
					 				  					  "id"   : "PSH253" 
					 				  					}
					 				  					]
					 				},
					 				{
					 				  "number" : 3,
					 				  "classrooms": [
					 				  					{
					 				  					  "number" : "363",
					 				  					  "id"   : "PSH363"
					 				  					},
					 				  					{
					 				  					  "number" : "390",
					 				  					  "id"   : "PSH390" 
					 				  					}
					 				  					]
					 				}
					 				]
					},
					{
					 "name" : "Stauffer A",
					 "address" : "950 S. Forest Mall Tempe, AZ 85281",
					 "floors" : [
					 				{
					 				  "number" : 1,
					 				  "classrooms": [
					 				  					{
					 				  					  "number" : "101",
					 				  					  "id"   : "STAUF101"
					 				  					},
					 				  					{
					 				  					  "number" : "140",
					 				  					  "id"   : "STAUF140" 
					 				  					}
					 				  					]
					 				},
					 				{
					 				  "number" : 2,
					 				  "classrooms": [
					 				  					{
					 				  					  "number" : "206",
					 				  					  "id"   : "STAUF206"
					 				  					},
					 				  					{
					 				  					  "number" : "266",
					 				  					  "id"   : "STAUF266" 
					 				  					}
					 				  					]
					 				},
					 				{
					 				  "number" : 3,
					 				  "classrooms": [
					 				  					{
					 				  					  "number" : "311",
					 				  					  "id"   : "STAUF311"
					 				  					},
					 				  					{
					 				  					  "number" : "318",
					 				  					  "id"   : "STAUF318" 
					 				  					}
					 				  					]
					 				}
					 				]
					},
					{
					 "name" : "Wexler Hall",
					 "address" : "450 E Tyler Mall, Tempe, AZ 85281",
					 "floors" : [
					 				{
					 				  "number" : 1,
					 				  "classrooms": [
					 				  					{
					 				  					  "number" : "A103",
					 				  					  "id"   : "WXLRA103"
					 				  					},
					 				  					{
					 				  					  "number" : "A107",
					 				  					  "id"   : "WXLRA107" 
					 				  					}
					 				  					]
					 				},
					 				{
					 				  "number" : 2,
					 				  "classrooms": [
					 				  					{
					 				  					  "number" : "A201",
					 				  					  "id"   : "WXLRA201"
					 				  					},
					 				  					{
					 				  					  "number" : "A290",
					 				  					  "id"   : "WXLRA290" 
					 				  					}
					 				  					]
					 				},
					 				{
					 				  "number" : 3,
					 				  "classrooms": [
					 				  					{
					 				  					  "number" : "A303",
					 				  					  "id"   : "WXLRA303"
					 				  					},
					 				  					{
					 				  					  "number" : "A310",
					 				  					  "id"   : "WXLRA310" 
					 				  					}
					 				  					]
					 				}
					 				]
					}
				] //end of buildings
}
					
    callback(null, responseData); 
}