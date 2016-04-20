institution = Institution.create(title: 'Instituto Mexicano', subdomain: 'instmexico')
superadmin = User.create(name: 'Superadmin radar', email: 'superadmin@radar.com', password: '12345678', institution_id: institution.id)
superadmin.add_role :superadmin

physical_violence = ViolenceType.create(name: 'Física')
threat = ViolenceType.create(name: 'Amenaza')
exclusion = ViolenceType.create(name: 'Exclusión')
verbal_bullying = ViolenceType.create(name: 'Verbal')
derison = ViolenceType.create(name: 'Burla')
cyber_bullying = ViolenceType.create(name: 'Cyber bullying')
property_damage = ViolenceType.create(name: 'Daño a pertenencias')
helplessness = ViolenceType.create(name: 'Indefensión')
discomfort_school = ViolenceType.create(name: 'Malestar escolar')

victim_survey = Survey.create(description: 'Cuestionario para Victimas', type_survey: 'victima')

Question.create(
  text: 'Me  han golpeado con la intención de lastimarme en el último mes en la escuela',
  survey_id: victim_survey.id,
  violence_type_id: physical_violence.id
)
Question.create(
  text: 'Me han dañado o lastimado el cuerpo de alguna manera',
  survey_id: victim_survey.id,
  violence_type_id: physical_violence.id
)
Question.create(
  text: 'Me han amenazado con hacerme daño o lastimarme',
  survey_id: victim_survey.id,
  violence_type_id: threat.id
)
Question.create(
  text: 'Me han amenazado con hacerme daño o lastimarme si digo algo de lo que me hacen',
  survey_id: victim_survey.id,
  violence_type_id: threat.id
)
Question.create(
  text: 'Han inventado rumores para hacerme sentir mal a propósito y para que los demás no me hablen',
  survey_id: victim_survey.id,
  violence_type_id: exclusion.id
)
Question.create(
  text: 'No me han dejado participar en alguna actividad para hacerme sentir mal',
  survey_id: victim_survey.id,
  violence_type_id: exclusion.id
)
Question.create(
  text: 'Me ignoran, hacen como que no existo para dañarme de alguna manera',
  survey_id: victim_survey.id,
  violence_type_id: exclusion.id
)
Question.create(
  text: 'Me han dicho cosas que me hieren, humillan, lastiman y no sé cómo detenerlo',
  survey_id: victim_survey.id,
  violence_type_id: verbal_bullying.id
)
Question.create(
  text: 'Me dicen un apodo o groserías que me lastiman',
  survey_id: victim_survey.id,
  violence_type_id: verbal_bullying.id
)
Question.create(
  text: 'Se han burlado de mi persona, o de mis gustos, o de mi forma de vestir y lo han hecho a propósito con la intención de dañarme',
  survey_id: victim_survey.id,
  violence_type_id: derison.id
)
Question.create(
  text: 'Se ríen cuando hablo o participo en clase con la intención de que me sienta mal',
  survey_id: victim_survey.id,
  violence_type_id: derison.id
)
Question.create(
  text: 'Me han faltado el respeto a través de mensajes por celular o por alguna red social con la intención de afectarme y hacerme sentir mal',
  survey_id: victim_survey.id,
  violence_type_id: cyber_bullying.id
)
Question.create(
  text: 'Han subido algún video de mi en alguna situación vergonzosa que me hace sentir mal , apenado, avergonzado',
  survey_id: victim_survey.id,
  violence_type_id: cyber_bullying.id
)
Question.create(
  text: 'Me han escondido material de clase, cuadernos, mochila para molestarme',
  survey_id: victim_survey.id,
  violence_type_id: property_damage.id
)
Question.create(
  text: 'Han dañado mi material, mis útiles etc... con la intención de hacerme sentir mal y afectarme',
  survey_id: victim_survey.id,
  violence_type_id: property_damage.id
)
Question.create(
  text: 'Siento que no me puedo defender de esta persona o estas personas',
  survey_id: victim_survey.id,
  violence_type_id: helplessness.id
)
Question.create(
  text: 'Estoy asustado, triste y me siento indefenso ante lo que me hacen',
  survey_id: victim_survey.id,
  violence_type_id: helplessness.id
)
Question.create(
  text: 'Siento que no quiero ir a la escuela para evitar sentirme mal a causa de algún compañero',
  survey_id: victim_survey.id,
  violence_type_id: discomfort_school.id
)
Question.create(
  text: 'He inventado pretextos para no ir a la escuela para evitar que me molesten',
  survey_id: victim_survey.id,
  violence_type_id: discomfort_school.id
)

witness_survey = Survey.create(description: 'Cuestionario para Testigo', type_survey: 'testigo')

Question.create(
  text: 'He visto como golpean a algún compañero(a) con la intención de lastimarlo y esto sucede muy a menudo',
  survey_id: witness_survey.id,
  violence_type_id: physical_violence.id
)

Question.create(
  text: 'Siento que muy seguido dañan o lastiman físicamente a esta persona con la intención  de hacerlo sentir mal y mi compañero(a) no se defiende',
  survey_id: witness_survey.id,
  violence_type_id: physical_violence.id
)

Question.create(
  text: 'Sé que mi compañero(a)  ha sido amenazado(a) con que le van a hacer daño o lastimar',
  survey_id: witness_survey.id,
  violence_type_id: threat.id
)

Question.create(
  text: 'He visto que han amenazado a mi compañero(a) si dice a alguien lo que le hacen',
  survey_id: witness_survey.id,
  violence_type_id: threat.id
)

Question.create(
  text: 'He visto que no lo han dejado participar en alguna actividad, lo ignoran, hacen como que no existe para dañarlo(a)  de alguna manera',
  survey_id: witness_survey.id,
  violence_type_id: exclusion.id
)

Question.create(
  text: 'Siento que no puedo defender a mi compañero(a) de estas personas por que me da miedo que después me lo hagan a mi',
  survey_id: witness_survey.id,
  violence_type_id: helplessness.id
)

Question.create(
  text: 'Estoy asustado, triste y enojado ante lo que veo que le hacen a mi compañero (a) y siento que no hay nada que podamos hacer',
  survey_id: witness_survey.id,
  violence_type_id: helplessness.id
)

Question.create(
  text: 'He escuchado que le dicen  cosas que  hieren, humillan, lastiman',
  survey_id: witness_survey.id,
  violence_type_id: verbal_bullying.id
)

Question.create(
  text: 'Se han burlado de esta persona, de lo que dice, de lo que piensa y lo han hecho a propósito con la intención de dañar',
  survey_id: witness_survey.id,
  violence_type_id: derison.id
)

Question.create(
  text: 'Han subido algún video de mi compañero(a)  en alguna situación vergonzosa que lo hace sentir mal, apenado(a), avergonzado(a)',
  survey_id: witness_survey.id,
  violence_type_id: cyber_bullying.id
)
Question.create(
  text: 'He sabido que le han amenazado o le han faltado el respeto a través de mensajes por celular o por alguna red social con la intención de afectarlo(a) y hacerlo(a) sentir mal',
  survey_id: witness_survey.id,
  violence_type_id: cyber_bullying.id
)
