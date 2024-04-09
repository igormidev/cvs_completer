// ignore_for_file: public_member_api_docs, sort_constructors_first

class AgentInfos {
  final String? agentName;
  final String? agencyName;
  final String? agentPhone;
  final String? agentEmail;
  const AgentInfos({
    required this.agentName,
    required this.agencyName,
    required this.agentPhone,
    required this.agentEmail,
  });

  @override
  bool operator ==(covariant AgentInfos other) {
    if (identical(this, other)) {
      return true;
    }

    return other.agentName == agentName &&
        other.agencyName == agencyName &&
        other.agentPhone == agentPhone &&
        other.agentEmail == agentEmail;
  }

  @override
  int get hashCode {
    return agentName.hashCode ^
        agencyName.hashCode ^
        agentPhone.hashCode ^
        agentEmail.hashCode;
  }
}
