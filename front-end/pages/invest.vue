<template>
    <div class="bg-white">
        <header class="fixed inset-x-0 top-0 z-50 bg-yellow-500 bg-opacity-5 backdrop-blur-sm">
            <nav class="flex items-center justify-between p-6 lg:px-8" aria-label="Global">
                <div class="flex lg:flex-1">
                <a href="#" class="-m-1.5 p-1.5">
                    <span class="sr-only">Calculate Investment</span>
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="size-6">
                        <path fill-rule="evenodd" d="M2.25 13.5a8.25 8.25 0 0 1 8.25-8.25.75.75 0 0 1 .75.75v6.75H18a.75.75 0 0 1 .75.75 8.25 8.25 0 0 1-16.5 0Z" clip-rule="evenodd" />
                        <path fill-rule="evenodd" d="M12.75 3a.75.75 0 0 1 .75-.75 8.25 8.25 0 0 1 8.25 8.25.75.75 0 0 1-.75.75h-7.5a.75.75 0 0 1-.75-.75V3Z" clip-rule="evenodd" />
                    </svg>
                </a>
                </div>
                <div class="flex lg:hidden">
                    <button type="button" class="-m-2.5 inline-flex items-center justify-center rounded-md p-2.5 text-gray-700" @click="mobileMenuOpen = true">
                        <span class="sr-only">Open main menu</span>
                        <Bars3Icon class="h-6 w-6" aria-hidden="true" />
                    </button>
                </div>
                <div class="hidden lg:flex lg:gap-x-12">
                    <nuxt-link v-for="item in navigation" :key="item.name" :to="item.to" to="{{ item.to }}" >
                        <a class="text-sm font-semibold leading-6 text-gray-900 hover:text-yellow-500">{{ item.name }}</a>
                    </nuxt-link>
                </div>
                <div class="hidden lg:flex lg:flex-1 lg:justify-end">
                </div>
            </nav>
            <Dialog class="lg:hidden" @close="mobileMenuOpen = false" :open="mobileMenuOpen">
                <div class="fixed inset-0 z-50" />
                <DialogPanel class="fixed inset-y-0 right-0 z-50 w-full overflow-y-auto bg-white px-6 py-6 sm:max-w-sm sm:ring-1 sm:ring-gray-900/10">
                <div class="flex items-center justify-between">
                    <a href="#" class="-m-1.5 p-1.5">
                        <span class="sr-only">Calculate Investment</span>
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="currentColor" class="size-6">
                            <path fill-rule="evenodd" d="M2.25 13.5a8.25 8.25 0 0 1 8.25-8.25.75.75 0 0 1 .75.75v6.75H18a.75.75 0 0 1 .75.75 8.25 8.25 0 0 1-16.5 0Z" clip-rule="evenodd" />
                            <path fill-rule="evenodd" d="M12.75 3a.75.75 0 0 1 .75-.75 8.25 8.25 0 0 1 8.25 8.25.75.75 0 0 1-.75.75h-7.5a.75.75 0 0 1-.75-.75V3Z" clip-rule="evenodd" />
                        </svg>
                    </a>
                    <button type="button" class="-m-2.5 rounded-md p-2.5 text-gray-700" @click="mobileMenuOpen = false">
                    <span class="sr-only">Close menu</span>
                    <XMarkIcon class="h-6 w-6" aria-hidden="true" />
                    </button>
                </div>
                <div class="mt-6 flow-root">
                    <div class="-my-6 divide-y divide-gray-500/10">
                    <div class="space-y-2 py-6">
                        <a v-for="item in navigation" :key="item.name" :href="item.href" class="-mx-3 block rounded-lg px-3 py-2 text-base font-semibold leading-7 text-gray-900 hover:bg-gray-50">{{ item.name }}</a>
                    </div>
                    <div class="py-6">
                        <a href="#" class="-mx-3 block rounded-lg px-3 py-2.5 text-base font-semibold leading-7 text-gray-900 hover:bg-gray-50">Log in</a>
                    </div>
                    </div>
                </div>
                </DialogPanel>
            </Dialog>
        </header>

        <div class="relative isolate px-6 pt-32 pb-32 lg:px-8 sm:px-auto">
            <div class="absolute inset-x-0 -top-40 -z-10 transform-gpu overflow-hidden blur-3xl sm:-top-80" aria-hidden="true">
                <div class="relative left-[calc(50%-11rem)] aspect-[1155/678] w-[36.125rem] -translate-x-1/2 rotate-[30deg] bg-gradient-to-tr from-[#F59E0B] to-[#F59E0B] opacity-30 sm:left-[calc(50%-30rem)] sm:w-[72.1875rem]" style="clip-path: polygon(74.1% 44.1%, 100% 61.6%, 97.5% 26.9%, 85.5% 0.1%, 80.7% 2%, 72.5% 32.5%, 60.2% 62.4%, 52.4% 68.1%, 47.5% 58.3%, 45.2% 34.5%, 27.5% 76.7%, 0.1% 64.9%, 17.9% 100%, 27.6% 76.8%, 76.1% 97.7%, 74.1% 44.1%)" />
            </div>
            <form class="lg:w-1/2 md:w-1/2 w-3/4 mx-auto" v-if="!isFormSubmitted" @submit.prevent="submitForm">
                <div class="form-group">
                    <div class="space-y-12">
                        <h2 class="text-base font-semibold leading-7 text-gray-900 text-center">Investasi</h2>
                        <p class="mt-1 text-sm leading-6 text-gray-600 text-center">Fill this form to calculate your investment.</p>
                        <div class="mt-10 grid grid-cols-1 gap-x-6 gap-y-8 sm:grid-cols-6">
                            <div class="col-span-full">
                                <label for="jenis-kelamin" class="block text-sm font-medium leading-6 text-gray-900">Jenis Kelamin</label>
                                <div class="mt-2">
                                    <select id="jenis-kelamin" v-model="formData.jenis_kelamin" name="jenis-kelamin" autocomplete="jenis-kelamin" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 focus:ring-2 focus:ring-inset focus:ring-yellow-500 sm:text-sm sm:leading-6">
                                        <option value="Pria">Pria</option>
                                        <option value="Wanita">Wanita</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-span-full">
                                <label for="usia" class="block text-sm font-medium leading-6 text-gray-900">Usia</label>
                                <div class="mt-2">
                                    <input type="number" v-model="formData.usia" name="usia" id="usia" autocomplete="usia" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-yellow-500 sm:text-sm sm:leading-6" placeholder="Umur Anda"/>
                                </div>
                            </div>
                            <div class="col-span-full">
                                <label for="perokok" class="block text-sm font-medium leading-6 text-gray-900">Apakah Anda Perokok?</label>
                                <div class="mt-2">
                                    <select id="perokok" v-model="formData.perokok" name="perokok" autocomplete="perokok" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 focus:ring-2 focus:ring-inset focus:ring-yellow-500 sm:text-sm sm:leading-6">
                                        <option value="Ya">Ya</option>
                                        <option value="Tidak">Tidak</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-span-full">
                                <label for="nominal" class="block text-sm font-medium leading-6 text-gray-900">Nominal Investasi</label>
                                <div class="mt-2">
                                    <input type="number" v-model="formData.nominal" name="nominal" id="nominal" autocomplete="nominal" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-yellow-500 sm:text-sm sm:leading-6" placeholder="1000000"/>
                                </div>
                            </div>
                            <div class="col-span-full">
                                <label for="lama_investasi" class="block text-sm font-medium leading-6 text-gray-900">Lama Investasi (dalam tahun)</label>
                                <div class="mt-2">
                                    <input type="number" v-model="formData.lama_investasi" name="lama_investasi" id="lama_investasi" autocomplete="lama_investasi" class="block w-full rounded-md border-0 py-1.5 text-gray-900 shadow-sm ring-1 ring-inset ring-gray-300 placeholder:text-gray-400 focus:ring-2 focus:ring-inset focus:ring-yellow-500 sm:text-sm sm:leading-6" placeholder="15"/>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="mt-6 flex items-center justify-end gap-x-6">
                        <button type="button" class="text-sm font-semibold leading-6 text-gray-900">Batal</button>
                        <button type="submit" class="rounded-md bg-yellow-500 px-3 py-2 text-sm font-semibold text-white shadow-sm hover:bg-yellow-400 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-yellow-600">Hitung</button>
                    </div>
                </div>
            </form>
            <div class="result lg:w-1/2 md:w-1/2 w-3/4 mx-auto" v-else>
                <div>
                    <div class="px-4 sm:px-0 text-center">
                        <h3 class="text-base font-semibold leading-7 text-gray-900">Investment Result</h3>
                        <p class="mt-1 max-w-2xl text-sm leading-6 text-gray-500">Thank You for choosing us! Hope you'll get your dream.</p>
                    </div>
                    <div v-for="(item, index) in investment" :key="index" class="mt-6 border-t border-gray-100">
                        <dl class="divide-y divide-gray-100">
                            <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0">
                                <dt class="text-sm font-medium leading-6 text-gray-900">Tahun</dt>
                                <dd class="mt-1 text-sm leading-6 text-gray-700 sm:col-span-2 sm:mt-0">{{ index }}</dd>
                            </div>
                            <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0">
                                <dt class="text-sm font-medium leading-6 text-gray-900">Awal</dt>
                                <dd class="mt-1 text-sm leading-6 text-gray-700 sm:col-span-2 sm:mt-0">{{ item.awal }}</dd>
                            </div>
                            <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0">
                                <dt class="text-sm font-medium leading-6 text-gray-900">Bunga</dt>
                                <dd class="mt-1 text-sm leading-6 text-gray-700 sm:col-span-2 sm:mt-0">{{ item.bunga }}</dd>
                            </div>
                            <div class="px-4 py-6 sm:grid sm:grid-cols-3 sm:gap-4 sm:px-0">
                                <dt class="text-sm font-medium leading-6 text-gray-900">Akhir</dt>
                                <dd class="mt-1 text-sm leading-6 text-gray-700 sm:col-span-2 sm:mt-0">{{ item.akhir }}</dd>
                            </div>
                        </dl>
                    </div>
                    <!-- <div v-for="(item, key) in investment" :key="key">
                        <p>Tahun: {{ item }}</p>
                    </div> -->
                </div>
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import { Dialog, DialogPanel } from '@headlessui/vue'
import { Bars3Icon, XMarkIcon } from '@heroicons/vue/24/outline'
import { PaperClipIcon } from '@heroicons/vue/20/solid'
import { useAsyncData } from 'nuxt/app';

const navigation = [
    { name: 'Home', to: '/' },
    { name: 'Payment', to: '/payment' },
    { name: 'Investment', to: '/invest' },
]

const mobileMenuOpen = ref(false)
interface InvestmentItem {
  awal: number;
  bunga: number;
  akhir: number;
}

interface InvestmentResponse {
  [key: string]: InvestmentItem;
}

const formData = ref({
    jenis_kelamin: '',
    usia: null,
    perokok: '',
    nominal: null,
    lama_investasi: null,
});

let investment = ref<InvestmentResponse>({});
const isFormSubmitted = ref(false);

const submitForm = async () => {
    const { data, error } = await useAsyncData('submitForm', () => 
        $fetch('http://localhost:2000/investasi', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(formData.value)
        })
    );

    if (error.value) {
        console.error('Error submitting form:', error.value);
    } else {
        console.log('Form submitted successfully:', investment);
        investment = data.value.data;
        isFormSubmitted.value = true;
    }
	}

// const formData = ref({
//     jenis_kelamin: '',
//     usia: null,
//     perokok: '',
//     nominal: null,
//     lama_investasi: null,
// })
// const investment = ref({
//     data: {

//     }
// });
// const isFormSubmitted = ref(false);

// const submitForm = async () => {
//     const { data, error } = await useAsyncData('submitForm', () => $fetch('http://localhost:2000/investasi', {
//         method: 'POST',
//         headers: {
//             'Content-Type': 'application/json'
//         },
//         body: JSON.stringify(formData.value)
//     }));

//     if (error.value) {
//         console.error('Error submitting form:', error.value);
//     } else {
//         console.log('Form submitted successfully:', data.value);
//         investment.value = data.value.response;
//         isFormSubmitted.value = true;
//     }
// }
</script>