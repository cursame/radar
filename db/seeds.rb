# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

victim_survey = Survey.create(description: 'Cuestionario para Victimas', type_survey: 'victima')

Question.create(
  text: 'Me  han golpeado con la intención de lastimarme en el último mes en la escuela',
  type_violence: 'Física',
  survey_id: victim_survey.id
)
Question.create(
  text: 'Me han dañado o lastimado el cuerpo de alguna manera',
  type_violence: 'Física',
  survey_id: victim_survey.id
)
Question.create(
  text: 'Me han amenazado con hacerme daño o lastimarme',
  type_violence: 'Amenaza',
  survey_id: victim_survey.id
)
Question.create(
  text: 'Me han amenazado con hacerme daño o lastimarme si digo algo de lo que me hacen',
  type_violence: 'Amenaza',
  survey_id: victim_survey.id
)
Question.create(
  text: 'Han inventado rumores para hacerme sentir mal a propósito y para que los demás no me hablen',
  type_violence: 'Exclusión',
  survey_id: victim_survey.id
)
Question.create(
  text: 'No me han dejado participar en alguna actividad para hacerme sentir mal',
  type_violence: 'Exclusión',
  survey_id: victim_survey.id
)
Question.create(
  text: 'Me ignoran, hacen como que no existo para dañarme de alguna manera',
  type_violence: 'Exclusión',
  survey_id: victim_survey.id
)
Question.create(
  text: 'Me han dicho cosas que me hieren, humillan, lastiman y no sé cómo detenerlo',
  type_violence: 'Verbal',
  survey_id: victim_survey.id
)
Question.create(
  text: 'Me dicen un apodo o groserías que me lastiman',
  type_violence: 'Verbal',
  survey_id: victim_survey.id
)
Question.create(
  text: 'Se han burlado de mi persona, o de mis gustos, o de mi forma de vestir y lo han hecho a propósito con la intención de dañarme',
  type_violence: 'Burla',
  survey_id: victim_survey.id
)
Question.create(
  text: 'Se ríen cuando hablo o participo en clase con la intención de que me sienta mal',
  type_violence: 'Burla',
  survey_id: victim_survey.id
)
Question.create(
  text: 'Me han faltado el respeto a través de mensajes por celular o por alguna red social con la intención de afectarme y hacerme sentir mal',
  type_violence: 'Cyber bullying',
  survey_id: victim_survey.id
)
Question.create(
  text: 'Han subido algún video de mi en alguna situación vergonzosa que me hace sentir mal , apenado, avergonzado',
  type_violence: 'Cyber bullying',
  survey_id: victim_survey.id
)
Question.create(
  text: 'Me han escondido material de clase, cuadernos, mochila para molestarme',
  type_violence: 'Daño a pertenencias',
  survey_id: victim_survey.id
)
Question.create(
  text: 'Han dañado mi material, mis útiles etc... con la intención de hacerme sentir mal y afectarme',
  type_violence: 'Daño a pertenencias',
  survey_id: victim_survey.id
)
Question.create(
  text: 'Siento que no me puedo defender de esta persona o estas personas',
  type_violence: 'Indefensión',
  survey_id: victim_survey.id
)
Question.create(
  text: 'Estoy asustado, triste y me siento indefenso ante lo que me hacen',
  type_violence: 'Indefensión',
  survey_id: victim_survey.id
)
Question.create(
  text: 'Siento que no quiero ir a la escuela para evitar sentirme mal a causa de algún compañero',
  type_violence: 'Malestar escolar',
  survey_id: victim_survey.id
)
Question.create(
  text: 'He inventado pretextos para no ir a la escuela para evitar que me molesten',
  type_violence: 'Malestar escolar',
  survey_id: victim_survey.id
)

witness_survey = Survey.create(description: 'Cuestionario para Testigo', type_survey: 'testigo')

Question.create(
  text: 'He visto como golpean a algún compañero(a) con la intención de lastimarlo y esto sucede muy a menudo',
  type_violence: 'Física',
  survey_id: witness_survey.id
)

Question.create(
  text: 'Siento que muy seguido dañan o lastiman físicamente a esta persona con la intención  de hacerlo sentir mal y mi compañero(a) no se defiende',
  type_violence: 'Física',
  survey_id: witness_survey.id
)

Question.create(
  text: 'Sé que mi compañero(a)  ha sido amenazado(a) con que le van a hacer daño o lastimar',
  type_violence: 'Amenaza',
  survey_id: witness_survey.id
)

Question.create(
  text: 'He visto que han amenazado a mi compañero(a) si dice a alguien lo que le hacen',
  type_violence: 'Amenaza',
  survey_id: witness_survey.id
)

Question.create(
  text: 'He visto que no lo han dejado participar en alguna actividad, lo ignoran, hacen como que no existe para dañarlo(a)  de alguna manera',
  type_violence: 'Exclusión',
  survey_id: witness_survey.id
)

Question.create(
  text: 'Siento que no puedo defender a mi compañero(a) de estas personas por que me da miedo que después me lo hagan a mi',
  type_violence: 'Indefensión',
  survey_id: witness_survey.id
)

Question.create(
  text: 'Estoy asustado, triste y enojado ante lo que veo que le hacen a mi compañero (a) y siento que no hay nada que podamos hacer',
  type_violence: 'Indefensión',
  survey_id: witness_survey.id
)

Question.create(
  text: 'He escuchado que le dicen  cosas que  hieren, humillan, lastiman',
  type_violence: 'Verbal',
  survey_id: witness_survey.id
)

Question.create(
  text: 'Se han burlado de esta persona, de lo que dice, de lo que piensa y lo han hecho a propósito con la intención de dañar',
  type_violence: 'Burla',
  survey_id: witness_survey.id
)

Question.create(
  text: 'Han subido algún video de mi compañero(a)  en alguna situación vergonzosa que lo hace sentir mal, apenado(a), avergonzado(a)',
  type_violence: 'Cyber bullying',
  survey_id: witness_survey.id
)
Question.create(
  text: 'He sabido que le han amenazado o le han faltado el respeto a través de mensajes por celular o por alguna red social con la intención de afectarlo(a) y hacerlo(a) sentir mal',
  type_violence: 'Cyber bullying',
  survey_id: witness_survey.id
)
