//
//  TrainerLogInResponse.swift
//  iRevatureQuizPro
//
//  Created by Kyle Keck on 3/5/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation

struct TrainerLoginResponse {
    var statusCode: Int
    var description: String
    var data: [LoginData]
}

{
    "id": 2504,
    "userName": "uday.kumar@revature.com",
    "isActive": true,
    "createdBy": 2491,
    "createdOn": "2020-03-04T20:25:43",
    "currentLoginTime": "2020-03-05T18:42:02.299",
    "previousLoginTime": "2020-03-05T18:37:04",
    "updatedBy": null,
    "updatedOn": null,
    "passwordResetRequest": true,
    "passwordResetToken": null,
    "isFirstLogin": false,
    "isAdminV2Opted": false,
    "password": null,
    "ip": null,
    "location": null,
    "timeZone": "US/Hawaii",
    "locale": null,
    "sessionId": null,
    "employeeId": 488,
    "activeStatus": null,
    "displayFirstName": null,
    "displayLastName": null,
    "displayFullName": "Uday Kumar",
    "displayRoles": null,
    "displayEmail": "uday.kumar@revature.com",
    "killSessionManually": false,
    "fromIdleMonitor": false,
    "currentSystemRole": {
        "id": 3,
        "code": "SR003",
        "description": "Training Admin",
        "hierarchy": 3,
        "isActive": true,
        "name": "Training Admin",
        "isOrgRoleActive": true
    },
    "switchUserSystemRole": null,
    "systemUserRoles": [
        {
            "id": 3,
            "code": "SR003",
            "description": "Training Admin",
            "hierarchy": 3,
            "isActive": true,
            "name": "Training Admin",
            "isOrgRoleActive": true
        },
        {
            "id": 17,
            "code": "SR015",
            "description": "Content Admin",
            "hierarchy": 4,
            "isActive": true,
            "name": "Content Admin",
            "isOrgRoleActive": true
        },
        {
            "id": 4,
            "code": "SR004",
            "description": "Trainer",
            "hierarchy": 7,
            "isActive": true,
            "name": "Trainer",
            "isOrgRoleActive": true
        }
    ],
    "orgSystemUsers": [
        {
            "id": 361,
            "organization": {
                "id": 2,
                "name": "Revature",
                "aliasName": "REV",
                "type": "Corporate Partner",
                "sfAccountId": "0015600000JogkIAAR",
                "sfAccountName": "Revature",
                "isContentSubscribed": true,
                "isAllContentSubscribed": true,
                "isActive": true,
                "createdOn": "2017-04-12T05:52:13",
                "createdBy": 1,
                "modifiedOn": "2020-03-02T10:04:28",
                "modifiedBy": 463,
                "isRootOrganization": false,
                "isAllVideoSubscribed": null,
                "isAllQsnSubscribed": null,
                "isEnabledUserVerification": true,
                "isPaymentOptionEnabled": false,
                "isSignUpPageActive": true,
                "organizationCode": null
            },
            "isActive": true,
            "currentSystemRole": null,
            "systemUserRoles": null
        }
    ],
    "primaryOrganization": {
        "id": 2,
        "name": "Revature",
        "aliasName": "REV",
        "type": "Corporate Partner",
        "sfAccountId": "0015600000JogkIAAR",
        "sfAccountName": "Revature",
        "isContentSubscribed": true,
        "isAllContentSubscribed": true,
        "isActive": true,
        "createdOn": "2017-04-12T05:52:13",
        "createdBy": 1,
        "modifiedOn": "2020-03-02T10:04:28",
        "modifiedBy": 463,
        "isRootOrganization": false,
        "isAllVideoSubscribed": null,
        "isAllQsnSubscribed": null,
        "isEnabledUserVerification": true,
        "isPaymentOptionEnabled": false,
        "isSignUpPageActive": true,
        "organizationCode": null
    },
    "currentOrganization": {
        "id": 2,
        "name": "Revature",
        "aliasName": "REV",
        "type": "Corporate Partner",
        "sfAccountId": "0015600000JogkIAAR",
        "sfAccountName": "Revature",
        "isContentSubscribed": true,
        "isAllContentSubscribed": true,
        "isActive": true,
        "createdOn": "2017-04-12T05:52:13",
        "createdBy": 1,
        "modifiedOn": "2020-03-02T10:04:28",
        "modifiedBy": 463,
        "isRootOrganization": false,
        "isAllVideoSubscribed": null,
        "isAllQsnSubscribed": null,
        "isEnabledUserVerification": true,
        "isPaymentOptionEnabled": false,
        "isSignUpPageActive": true,
        "organizationCode": null
    },
    "loginToken": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbXBJZCI6IjQ4OCIsInJvbGUiOiJTUjAwMyIsInJvbGVzIjpbIlNSMDAzIiwiU1IwMTUiLCJTUjAwNCJdLCJvcmdhbml6YXRpb24iOiIyIiwiaXNzIjoiUmV2YXR1cmVQcm8iLCJuYW1lIjoidWRheS5rdW1hckByZXZhdHVyZS5jb20iLCJvcmdhbml6YXRpb25zIjpbIjIiXSwidGltZVpvbmUiOiJVUy9IYXdhaWkiLCJwcmltYXJ5X29yZ2FuaXphdGlvbiI6IjIiLCJleHAiOjE1ODQ2NDMzMjIsImp0aSI6IjI1MDQifQ.scwIvDVBVHfO3rhMRe4GacnKUu8SLwFZ5x5uiTRJ8mI",
    "encryptedLoginToken": "7rL8RebbpebrWj1OwMowZwC2xR6f7J7J68tKw8DZbuzpt+Mgk7Bt0WBcKMVCIdsSwYYvgpfaCsM+PGXnKFFsDRztWLuoVAyWx9eWFFZC3KonSuNomkK/YHkdzNRLvKzBLb6tIWH/FJ4hyM1d5LZBA+6bZ0OZftf8D6Y7Kq70pwMsxCfouRFocx+PXU5OVpU+Sc+leu11Eyr22QeL7ZPh4h0gDojj7b9nmHZbTFniuiFHLHPTQQr6SWoWRdNubPbttXOfFq9hhrjId2LH/SIh9ze4VE0F0Koi65y98aVLt1N7vnBhGWjAzmg10SX1aqcNCMccT/BWsiQnTJxxveELPb7XfDwkB4mV6VX37O7g0HGoWp+NFqEBGqy1+0QmBRYIi+gA0lSe4TWLqzR+1gEsy3Sd7oPD6ovo5hroUEtdjaTJaWpfewOnqhNLNibOU0zoGJQDRRXiEsCrYF81DjvVQLt7CZBO8nXUDkLeUcQ/Vv56ObPGMMjFsqVpVang33PgXBOxxl1ncKn5joZZFu9Zog==",
    "tokenExpTime": 1584643322000,
    "regenThreshold": 10080,
    "validEmployee": true,
    "actualUserId": null,
    "roleCode": null,
    "orgId": null
}
