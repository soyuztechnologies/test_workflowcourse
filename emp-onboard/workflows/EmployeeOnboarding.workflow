{
	"contents": {
		"e3d28d7c-22af-4b7d-a4a2-c1c66e6ec1ce": {
			"classDefinition": "com.sap.bpm.wfs.Model",
			"id": "ats.emp.employeeonboarding",
			"subject": "EmployeeOnboarding",
			"name": "EmployeeOnboarding",
			"documentation": "Employee onboarding",
			"lastIds": "62d7f4ed-4063-4c44-af8b-39050bd44926",
			"events": {
				"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
					"name": "StartEvent1"
				},
				"2798f4e7-bc42-4fad-a248-159095a2f40a": {
					"name": "EndEvent1"
				}
			},
			"activities": {
				"8c80a140-3df5-45a0-9963-0dea48e2a2f8": {
					"name": "EmployeeData"
				},
				"ed9bca7c-2513-42b6-893e-2e56ef9c5c99": {
					"name": "PostEmployeeS4"
				},
				"a703d17c-58cb-4d2d-a58d-661e3e9566fd": {
					"name": "DetermineCardType"
				},
				"b1f4f7f3-12ab-46a1-b06a-5152cd43d8b2": {
					"name": "MapEmpBandToRule"
				},
				"dc7bf11c-c15c-4406-8837-3aa52d20d394": {
					"name": "SendEmailCard"
				}
			},
			"sequenceFlows": {
				"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
					"name": "SequenceFlow1"
				},
				"e3a8102d-9107-432c-8ef6-16c205720518": {
					"name": "SequenceFlow2"
				},
				"3b8c25a7-7671-4369-a76a-523025cef7b1": {
					"name": "SequenceFlow3"
				},
				"6650c0c9-77ac-4dda-a12b-575b6fe2dc3d": {
					"name": "SequenceFlow4"
				},
				"0d0bcd79-106d-46b8-9a17-b5c998f31a86": {
					"name": "SequenceFlow5"
				},
				"fbea8297-f261-4681-820c-796d11409057": {
					"name": "SequenceFlow6"
				}
			},
			"diagrams": {
				"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {}
			}
		},
		"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
			"classDefinition": "com.sap.bpm.wfs.StartEvent",
			"id": "startevent1",
			"name": "StartEvent1",
			"sampleContextRefs": {
				"f7ebb200-04bf-464c-9514-7138ba91631e": {}
			}
		},
		"2798f4e7-bc42-4fad-a248-159095a2f40a": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent1",
			"name": "EndEvent1"
		},
		"8c80a140-3df5-45a0-9963-0dea48e2a2f8": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "EmployeeData",
			"description": "On-boarding",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"supportsForward": false,
			"userInterface": "sapui5://comsapbpmworkflow.comsapbpmwusformplayer/com.sap.bpm.wus.form.player",
			"recipientUsers": "${info.startedBy}",
			"formReference": "/forms/EmployeeOnboarding/EmployeeOnboard.form",
			"userInterfaceParams": [{
				"key": "formId",
				"value": "employeeonboard"
			}, {
				"key": "formRevision",
				"value": "1.0"
			}],
			"id": "usertask1",
			"name": "EmployeeData"
		},
		"ed9bca7c-2513-42b6-893e-2e56ef9c5c99": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "S4HANA",
			"destinationSource": "consumer",
			"path": "/sap/opu/odata/sap/ZATS_WF_EMP_SRV/EmpWorkflowSet",
			"httpMethod": "POST",
			"xsrfPath": "/sap/opu/odata/sap/ZATS_WF_EMP_SRV/$metadata",
			"requestVariable": "${context.employeeData}",
			"responseVariable": "${context.resultEmployee}",
			"id": "servicetask1",
			"name": "PostEmployeeS4",
			"documentation": "Send employee data to S/4HANA"
		},
		"a703d17c-58cb-4d2d-a58d-661e3e9566fd": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "BUSINESS_RULES",
			"destinationSource": "consumer",
			"path": "/rest/v2/workingset-rule-services",
			"httpMethod": "POST",
			"requestVariable": "${context.businessRule}",
			"responseVariable": "${context.resultBusinesssRule}",
			"id": "servicetask2",
			"name": "DetermineCardType",
			"documentation": "Find Card type depends on employee band"
		},
		"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow1",
			"name": "SequenceFlow1",
			"sourceRef": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3",
			"targetRef": "8c80a140-3df5-45a0-9963-0dea48e2a2f8"
		},
		"e3a8102d-9107-432c-8ef6-16c205720518": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow2",
			"name": "SequenceFlow2",
			"sourceRef": "8c80a140-3df5-45a0-9963-0dea48e2a2f8",
			"targetRef": "ed9bca7c-2513-42b6-893e-2e56ef9c5c99"
		},
		"3b8c25a7-7671-4369-a76a-523025cef7b1": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow3",
			"name": "SequenceFlow3",
			"sourceRef": "ed9bca7c-2513-42b6-893e-2e56ef9c5c99",
			"targetRef": "b1f4f7f3-12ab-46a1-b06a-5152cd43d8b2"
		},
		"6650c0c9-77ac-4dda-a12b-575b6fe2dc3d": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow4",
			"name": "SequenceFlow4",
			"sourceRef": "a703d17c-58cb-4d2d-a58d-661e3e9566fd",
			"targetRef": "dc7bf11c-c15c-4406-8837-3aa52d20d394"
		},
		"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {
			"classDefinition": "com.sap.bpm.wfs.ui.Diagram",
			"symbols": {
				"df898b52-91e1-4778-baad-2ad9a261d30e": {},
				"53e54950-7757-4161-82c9-afa7e86cff2c": {},
				"6bb141da-d485-4317-93b8-e17711df4c32": {},
				"71349dda-b163-4067-b748-a4d585bbf492": {},
				"fd170118-7a61-45c9-9ec9-994e4e7bdd9e": {},
				"24817c14-2d25-4e8a-8698-a2c1c216930d": {},
				"ae4c433c-8471-4fe0-be08-24db2a0e2633": {},
				"693c3067-fe2a-472d-9677-0a88ebc6dcd3": {},
				"2b23cc7d-92d6-4fcf-8de7-2303ca4f02ca": {},
				"d8073d6b-2753-444f-b27c-91e931153e32": {},
				"ffe10ded-b9a2-4c3a-bee5-82ca76d54ee4": {},
				"2a58ee77-d4ee-429d-8a91-9886f05ca674": {},
				"6947a071-d45f-4188-b1ab-e069bf482870": {}
			}
		},
		"f7ebb200-04bf-464c-9514-7138ba91631e": {
			"classDefinition": "com.sap.bpm.wfs.SampleContext",
			"reference": "/sample-data/EmployeeOnboarding/employeeBoarding.json",
			"id": "default-start-context"
		},
		"df898b52-91e1-4778-baad-2ad9a261d30e": {
			"classDefinition": "com.sap.bpm.wfs.ui.StartEventSymbol",
			"x": 46,
			"y": 12,
			"width": 32,
			"height": 32,
			"object": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3"
		},
		"53e54950-7757-4161-82c9-afa7e86cff2c": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 44.5,
			"y": 644,
			"width": 35,
			"height": 35,
			"object": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"6bb141da-d485-4317-93b8-e17711df4c32": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "62,44 62,94",
			"sourceSymbol": "df898b52-91e1-4778-baad-2ad9a261d30e",
			"targetSymbol": "71349dda-b163-4067-b748-a4d585bbf492",
			"object": "c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f"
		},
		"71349dda-b163-4067-b748-a4d585bbf492": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 12,
			"y": 94,
			"width": 100,
			"height": 60,
			"object": "8c80a140-3df5-45a0-9963-0dea48e2a2f8"
		},
		"fd170118-7a61-45c9-9ec9-994e4e7bdd9e": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "62,154 62,204",
			"sourceSymbol": "71349dda-b163-4067-b748-a4d585bbf492",
			"targetSymbol": "24817c14-2d25-4e8a-8698-a2c1c216930d",
			"object": "e3a8102d-9107-432c-8ef6-16c205720518"
		},
		"24817c14-2d25-4e8a-8698-a2c1c216930d": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 12,
			"y": 204,
			"width": 100,
			"height": 60,
			"object": "ed9bca7c-2513-42b6-893e-2e56ef9c5c99"
		},
		"ae4c433c-8471-4fe0-be08-24db2a0e2633": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "62,264 62,314",
			"sourceSymbol": "24817c14-2d25-4e8a-8698-a2c1c216930d",
			"targetSymbol": "d8073d6b-2753-444f-b27c-91e931153e32",
			"object": "3b8c25a7-7671-4369-a76a-523025cef7b1"
		},
		"693c3067-fe2a-472d-9677-0a88ebc6dcd3": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 12,
			"y": 424,
			"width": 100,
			"height": 60,
			"object": "a703d17c-58cb-4d2d-a58d-661e3e9566fd"
		},
		"2b23cc7d-92d6-4fcf-8de7-2303ca4f02ca": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "62,484 62,534",
			"sourceSymbol": "693c3067-fe2a-472d-9677-0a88ebc6dcd3",
			"targetSymbol": "2a58ee77-d4ee-429d-8a91-9886f05ca674",
			"object": "6650c0c9-77ac-4dda-a12b-575b6fe2dc3d"
		},
		"62d7f4ed-4063-4c44-af8b-39050bd44926": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"maildefinition": 1,
			"sequenceflow": 6,
			"startevent": 1,
			"endevent": 1,
			"usertask": 1,
			"servicetask": 2,
			"scripttask": 1,
			"mailtask": 1
		},
		"b1f4f7f3-12ab-46a1-b06a-5152cd43d8b2": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/EmployeeOnboarding/mapping.js",
			"id": "scripttask1",
			"name": "MapEmpBandToRule"
		},
		"d8073d6b-2753-444f-b27c-91e931153e32": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 12,
			"y": 314,
			"width": 100,
			"height": 60,
			"object": "b1f4f7f3-12ab-46a1-b06a-5152cd43d8b2"
		},
		"0d0bcd79-106d-46b8-9a17-b5c998f31a86": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow5",
			"name": "SequenceFlow5",
			"sourceRef": "b1f4f7f3-12ab-46a1-b06a-5152cd43d8b2",
			"targetRef": "a703d17c-58cb-4d2d-a58d-661e3e9566fd"
		},
		"ffe10ded-b9a2-4c3a-bee5-82ca76d54ee4": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "62,374 62,424",
			"sourceSymbol": "d8073d6b-2753-444f-b27c-91e931153e32",
			"targetSymbol": "693c3067-fe2a-472d-9677-0a88ebc6dcd3",
			"object": "0d0bcd79-106d-46b8-9a17-b5c998f31a86"
		},
		"dc7bf11c-c15c-4406-8837-3aa52d20d394": {
			"classDefinition": "com.sap.bpm.wfs.MailTask",
			"destinationSource": "consumer",
			"id": "mailtask1",
			"name": "SendEmailCard",
			"mailDefinitionRef": "74565de8-bd7a-41e2-aae7-cd5db6d2f90d"
		},
		"2a58ee77-d4ee-429d-8a91-9886f05ca674": {
			"classDefinition": "com.sap.bpm.wfs.ui.MailTaskSymbol",
			"x": 12,
			"y": 534,
			"width": 100,
			"height": 60,
			"object": "dc7bf11c-c15c-4406-8837-3aa52d20d394"
		},
		"fbea8297-f261-4681-820c-796d11409057": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow6",
			"name": "SequenceFlow6",
			"sourceRef": "dc7bf11c-c15c-4406-8837-3aa52d20d394",
			"targetRef": "2798f4e7-bc42-4fad-a248-159095a2f40a"
		},
		"6947a071-d45f-4188-b1ab-e069bf482870": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "62,594 62,644",
			"sourceSymbol": "2a58ee77-d4ee-429d-8a91-9886f05ca674",
			"targetSymbol": "53e54950-7757-4161-82c9-afa7e86cff2c",
			"object": "fbea8297-f261-4681-820c-796d11409057"
		},
		"74565de8-bd7a-41e2-aae7-cd5db6d2f90d": {
			"classDefinition": "com.sap.bpm.wfs.MailDefinition",
			"name": "maildefinition1",
			"to": "anubhav.abap@gmail.com",
			"subject": "Employee ${context.employeeData.Empname} was onboarded",
			"text": "Dear ${context.employeeData.Empname},\n\nCongratulations for your new Job!\n\nA new Credit card of category ${context.resultBusinesssRule.Result[0].CardType} was issued to you.\n\nRegards,\nSAP BTP Workflow,\nAnubhavtrainings.com",
			"id": "maildefinition1"
		}
	}
}