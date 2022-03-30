<template>
    <b-container fluid>
      <b-row>
        <b-col cols="12">
          <b-card
              header="Aprakstiet problēmu"
              header-tag="header"
              footer-tag="footer"
              footer=" "
          >
            <b-col cols="12" class="text-center" v-if="!users && !options">
              <b-spinner variant="success" label="Spinning"></b-spinner>
            </b-col>

            <b-alert
                :show="dismissCountDown"
                v-if="created == 'success'"
                dismissible
                variant="success"
                @dismissed="dismissCountDown=0"
                @dismiss-count-down="countDownChanged"
            >
              <p>Problēma tika veiksmīgi pievienota!</p>
              <b-progress
                  variant="success"
                  :max="dismissSecs"
                  :value="dismissCountDown"
                  height="4px"
              ></b-progress>
            </b-alert>

            <b-alert
                :show="dismissCountDown"
                v-if="created == 'error'"
                dismissible
                variant="danger"
                @dismissed="dismissCountDown=0"
                @dismiss-count-down="countDownChanged"
            >
              <p>Ups! Notika kļūda</p>
              <p v-for="(e, index) in errors" :key="index"> {{ e[0] }} </p>
              <b-progress
                  variant="danger"
                  :max="dismissSecs"
                  :value="dismissCountDown"
                  height="4px"
              ></b-progress>
            </b-alert>

            <b-form @submit="onSubmit" v-if="users && options" enctype="multipart/form-data">
              <b-form-group
                  id="input-group-1"
                  label="Vārds, uzvārds:"
                  label-for="input-1"
              >
                <b-form-input id="input-1"
                              list="user-list" @input="changeName"
                              v-model="$v.form.userName.$model"
                              :state="validateState('userName')"
                              aria-describedby="input-3-live-feedback"
                ></b-form-input>
                <b-form-invalid-feedback
                    id="input-3-live-feedback"
                >Nav norādīts vards un uzvārds</b-form-invalid-feedback>

                <datalist id="user-list">
                  <option v-for="user in users" :id="user.id" :selected="selectedUser === user.id">{{ user.name }} {{ user.surname }}</option>
                </datalist>
              </b-form-group>

              <b-form-group
                  id="input-group-2"
                  label="Uzdevuma nosaukums:"
                  label-for="input-2"
              >
                <b-form-input id="input-2"
                              v-model="$v.form.problem_name.$model"
                              :state="validateState('problem_name')"
                              aria-describedby="input-3-live-feedback"
                ></b-form-input>
                <b-form-invalid-feedback
                    id="input-3-live-feedback"
                >Nav norādīts uzdevuma nosaukums</b-form-invalid-feedback>
              </b-form-group>

              <b-form-group
                  id="input-group-3"
                  label="Problēmas apraksts:"
                  label-for="input-3"
              >
                <b-form-textarea
                    id="input-3"
                    v-model="$v.form.problem_description.$model"
                    rows="3"
                    max-rows="6"
                    placeholder="Ievadiet problēmas aprakstu"
                    :state="validateState('problem_description')"
                    aria-describedby="input-3-live-feedback"
                ></b-form-textarea>
                <b-form-invalid-feedback
                    id="input-3-live-feedback"
                >Nav norādīts uzdevuma apraksts</b-form-invalid-feedback>
              </b-form-group>

              <b-form-group
                  id="input-group-4"
                  label="Prioritāte:"
                  label-for="input-4"
              >
                <b-form-select
                    id="input-4"
                    v-model="$v.form.priority.$model"
                    :options="Prioritys"
                    :state="validateState('priority')"
                    aria-describedby="input-3-live-feedback"
                ></b-form-select>
                <b-form-invalid-feedback
                    id="input-3-live-feedback"
                >Nav norādīts uzdevuma apraksts</b-form-invalid-feedback>
              </b-form-group>

              <b-form-group
                  id="input-group-5"
                  label="Nodaļa:"
                  label-for="input-5"
              >
                <b-form-input list="departments" v-model="form.departments"></b-form-input>

                <datalist id="departments">
                  <option v-for="et in options.departments.data" :id="et">{{ et.text }}</option>
                </datalist>

              </b-form-group>

              <b-form-group
                  id="input-group-11"
                  label="Atrašanās vieta:"
                  label-for="input-7"
              >

                <b-form-input list="units" v-model="form.units"></b-form-input>

                <datalist id="units">
                  <option v-for="et in options.units.data" :id="et">{{ et.text }}</option>
                </datalist>
              </b-form-group>

              <b-form-group
                  id="input-group-6"
                  label="Kabinets:"
                  label-for="input-6"
              >
                <b-form-input
                    class="mt-3 mb-0 apraksts"
                    id="input-6"
                    v-model="$v.form.room.$model"
                    type="text"
                    placeholder="Lūdzu norādiet kabineta numuru"
                    :state="validateState('room')"
                    aria-describedby="input-3-live-feedback"
                ></b-form-input>
                <b-form-invalid-feedback
                    id="input-3-live-feedback"
                >Nav norādīts uzdevuma apraksts</b-form-invalid-feedback>
              </b-form-group>


              <label>Izpildes termiņš:</label>
              <b-form-datepicker id="datepicker" v-model="$v.form.due_date.$model" class="mb-2 apraksts"></b-form-datepicker>

              <b-button class="mt-3 mb-0 poga" size="lg" type="submit" variant="primary">Pieteikt</b-button>

            </b-form>
          </b-card>
        </b-col>
      </b-row>
    </b-container>

</template>


<script>

import jsonToFormData from '@ajoelp/json-to-formdata';
import {mapActions, mapGetters} from "vuex";
import { required, minLength, maxLength } from 'vuelidate/lib/validators'
import { validationMixin } from 'vuelidate'

export default {
  name: "Create",
  data() {
    return {
      users: null,
      selectedUser: null,
      created: null,
      dismissSecs: 5,
      dismissCountDown: 0,
      form: {
        problem_name: '',
        problem_description: '',
        priority: null,
        departments: '',
        units:'',
        room: '',
        userName: '',
        due_date: '',
      },
      Prioritys: [{text: 'Izvēlieties prioritāti', value:null}, 'Zema prioritāte', 'Vidēja prioritāte', 'Augsta prioritāte', 'Kritiska prioritāte'],

    }
  },
  mixins: [validationMixin],
  validations: {
    form: {
      problem_name: {
        required,
      },
      problem_description: {
        required,
      },
      priority: {
        required,
      },
      room: {
        required,
      },
      userName: {
        required,
      },
      due_date: {
        required,
      },
    },
  },

  computed: {
    ...mapGetters ({
      options: "Options/options",
    })
  },
  methods: {
    ...mapActions ({
      fetchOptions: "Options/fetchOptions"
    }),
    onSubmit(event) {
      event.preventDefault()

      this.errors = [];

      this.$v.form.$touch();
      if (this.$v.form.$anyError) {
        this.errors.push('Nav aizpildīti visi lauki')
        window.scrollTo(0, 0);
        return;
      }
      axios.post('/problems', jsonToFormData(this.form)).then(response => {

        this.created = 'success';

        this.form.problem_name = ''
        this.form.problem_description = ''
        this.form.priority = ''
        this.form.departments = ''
        this.form.units = ''
        this.form.userName = ''
        this.form.due_date = ''
        this.form.room = ''

      }). catch(e => {
        this.created = 'error';
        this.errors = e.response.data.errors
      })

      window.scroll({
        top: 0,
        left: 0,
        behavior: 'smooth'
      })
      this.dismissCountDown = 5;
    },
    changeName(value) {
      let user = (this.users).find((e) => e.name+" "+e.surname === value)
      if(user !== undefined) {
        this.selectedUser = user
        this.form.userCode = user.personal_code
        this.form.user = user.id
      } else {
        this.form.user = null
        this.form.userCode = ''
      }
    },

    countDownChanged(dismissCountDown) {
      this.dismissCountDown = dismissCountDown
    },

    validateState(name) {
      // console.log(name)

      const {$dirty, $error} = this.$v.form[name];

      return $dirty ? !$error : null;
    },
  },
  mounted() {
    axios.get('/users').then(response => {
      this.users = response.data.data
    })
    this.fetchOptions();
  },
}
</script>

<style lang="scss" scoped>

</style>