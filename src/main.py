import os
import PySimpleGUI
import clips

def get_question_index(i: int):
    return 3 + i

def get_question_fact_index(i: int, n: int):
    return 3 + n + i

PySimpleGUI.theme('BrightColors')

layout = [
    [
        PySimpleGUI.Push(),
        PySimpleGUI.Column([
            [PySimpleGUI.Text(text='What species did you evolve from?', key='question_label', font=(None, 20), size=(60, 1), justification='c')],
            [PySimpleGUI.HorizontalSeparator()],
            [PySimpleGUI.Button(button_text='Start', key='start_button', font=(None, 12))]
        ], element_justification='c'),
        PySimpleGUI.Push()
    ],
    [PySimpleGUI.pin(PySimpleGUI.Radio('', key='answer_0', group_id='answers_radio', visible=False, enable_events=True, font=(None, 12), default=True), shrink=True)],
    [PySimpleGUI.pin(PySimpleGUI.Radio('', key='answer_1', group_id='answers_radio', visible=False, enable_events=True, font=(None, 12)), shrink=True)],
    [PySimpleGUI.pin(PySimpleGUI.Radio('', key='answer_2', group_id='answers_radio', visible=False, enable_events=True, font=(None, 12)), shrink=True)],
    [PySimpleGUI.pin(PySimpleGUI.Radio('', key='answer_3', group_id='answers_radio', visible=False, enable_events=True, font=(None, 12)), shrink=True)],
    [PySimpleGUI.pin(PySimpleGUI.Radio('', key='answer_4', group_id='answers_radio', visible=False, enable_events=True, font=(None, 12)), shrink=True)],
    [PySimpleGUI.pin(PySimpleGUI.Radio('', key='answer_5', group_id='answers_radio', visible=False, enable_events=True, font=(None, 12)), shrink=True)],
    [
        PySimpleGUI.Push(),
        PySimpleGUI.Column([[PySimpleGUI.Button('Continue', key='continue_button', visible=False, font=(None, 12))]], element_justification='c'),
        PySimpleGUI.Push()
    ],
    [
        PySimpleGUI.Push(),
        PySimpleGUI.Column([[PySimpleGUI.Button('Reset', key='reset_button', visible=False, font=(None, 12))]], element_justification='c'),
        PySimpleGUI.Push()
    ]
]

window = PySimpleGUI.Window('What species did you evolve from?', layout, size=(800,600))
environment = clips.Environment()
fact_to_assert = '(start)'
fact_name = ''
question_facts = []

environment.load(os.path.dirname(__file__) + '/logic.clp')

while True:
    event, values = window.read()

    if event == PySimpleGUI.WIN_CLOSED or event == 'Cancel':
        break
    
    elif event == 'start_button':
        window['start_button'].Update(visible=False)
        window['continue_button'].Update(visible=True)
        window['continue_button'].click()
        window['reset_button'].Update(visible=True)

    elif event == 'continue_button':
        environment.assert_string(fact_to_assert)
        environment.run()

        for i in range(6):
            window[f'answer_{i}'].Update(False, visible=False)

        for fact in environment.facts():
            if '(question ' in str(fact):
                fact_split = fact.__getitem__(0).split(';')
                fact_name = fact_split[0]
                fact_split[1] = int(fact_split[1])

                window['question_label'].Update(fact_split[2])

                tmp = []
                for i in range(fact_split[1]):
                    window[f'answer_{i}'].Update(text=fact_split[get_question_index(i)], visible=True)
                    tmp.append(fact_split[get_question_fact_index(i, fact_split[1])])
                window['answer_0'].Update(True)
                question_facts = tmp

                fact_to_assert = f'({fact_name} {question_facts[0]})'

                fact.retract()

            elif '(finish ' in str(fact):
                animal_name = fact.__getitem__(0)
                window['continue_button'].Update(visible=False)

                window['question_label'].Update(f'You are a/an: {animal_name}!')

    elif event == 'reset_button':
        window['question_label'].Update('What species did you evolve from?')

        window['start_button'].Update(visible=True)
        window['continue_button'].Update(visible=False)
        window['reset_button'].Update(visible=False)

        for i in range(6):
            window[f'answer_{i}'].Update(visible=False)

        fact_to_assert = '(start)'

        environment.reset()
    
    for i in range(len(question_facts)):
        if event == f'answer_{i}':
            fact_to_assert = f'({fact_name} {question_facts[i]})'

window.close()