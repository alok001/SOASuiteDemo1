xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://tech.com/CustomerService";
(:: import schema at "../Schema/CustomerService.xsd" ::)
declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/sp/dbReference";
(:: import schema at "../DBArtifacts/dbReference_sp.xsd" ::)

declare variable $addCustResp as element() (:: schema-element(ns1:OutputParameters) ::) external;

declare function local:func($addCustResp as element() (:: schema-element(ns1:OutputParameters) ::)) as element() (:: schema-element(ns2:commonResponse) ::) {
    <ns2:commonResponse>
        <ns2:statusCode>{fn:data($addCustResp/ns1:STATUS_CODE)}</ns2:statusCode>
        <ns2:message>{fn:data($addCustResp/ns1:STATUS_MESSAGE)}</ns2:message>
    </ns2:commonResponse>
};

local:func($addCustResp)